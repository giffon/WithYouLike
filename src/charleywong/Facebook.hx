package charleywong;

import js.html.URL;
import js.html.Response;
import js.lib.Promise;
import haxe.Json;
import js.node.Querystring;
import sys.io.File;
import haxe.io.Path;
import js.npm.fetch.Fetch.fetch;
using StringTools;
using Lambda;

typedef FacebookPageInfo = {
    id:String,
    ?username:String,
    name:String,
    about:String,
    category_list:Array<{
        id: String,
        name: String,
    }>,
    ?website:String,
    ?emails:Array<String>,
    ?single_line_address:String,
}

class Facebook {
    static public final appId = "628806881259482";
    static public final apiVersion = "v7.0";
    static public final accessToken = try {
        File.getContent("FACEBOOK_TOKEN").trim();
    } catch (e) {
        null;
    }
    static public final apiEndpoint = "https://graph.facebook.com";

    // These are percentages.
    // https://developers.facebook.com/docs/graph-api/overview/rate-limiting#headers
    static public var lastAppUsage:Null<{
        call_count:Float,
        total_time:Float,
        total_cputime:Float,
    }>;

    static function readAppUsage(r:Response) {
        switch (r.headers.get("X-App-Usage")) {
            case null: trace('No X-App-Usage');
            case str: lastAppUsage = Json.parse(str);
        }
    }

    static function getPageInfo(page:String):Promise<FacebookPageInfo> {
        return fetch(Path.join([apiEndpoint, apiVersion, page + "?" + Querystring.encode({
            access_token: accessToken,
            fields: "id,username,name,about,category_list,emails,single_line_address,website"
        })]))
            .then(r -> {
                readAppUsage(cast r);
                if (!r.ok) {
                    r.text().then(text -> throw text);
                } else {
                    r.json();
                }
            });
    }

    static function updateMeta() {
        var lastUpdateTimestamps = new Map<String, Float>();
        var entities = {
            var a = ServerMain.entityIndex.entities.map(e -> { e: e, r: Math.random() });
            a.sort((a,b) -> a.r > b.r ? 1 : a.r < b.r ? -1 : 0);
            a.map(_ -> _.e);
        };
        var fileOfEntity = [
            for (file => entity in ServerMain.entityIndex.entities)
            entity.id => file
        ];

        function getOldestFile() {
            for (i in 0...3) {
                var entity = entities.pop();
                if (entity == null) break;
                var file = fileOfEntity[entity.id];
                lastUpdateTimestamps[file] = Git.lastUpdateTimestamp(file);
            }

            var fileTimestamps = [
                for (file => t in lastUpdateTimestamps)
                {
                    file: file,
                    t: t,
                }
            ];
            fileTimestamps.sort((a,b) -> a.t > b.t ? 1 : a.t < b.t ? -1 : 0); // smaller timestamps come first
            return fileTimestamps[0].file;
        }

        function updateFile(file:String):Promise<Dynamic> {
            var entity = ServerMain.entityIndex.entities[file];
            var updates = [
                for (p in entity.webpages)
                switch (UrlExtractors.extractFbHomePage(new URL(p.url))) {
                    case null:
                        null;
                    case fb:
                        getPageInfo(fb)
                            .then(info -> p.meta = cast info);
                }
            ].filter(p -> p != null);
            return Promise.all(updates)
                .then(_ -> ServerMain.saveEntity(entity, false, true))
                .then(_ -> lastUpdateTimestamps[file] = Date.now().getTime() / 1000.0);
        }

        function updateOldest() {
            if (lastAppUsage != null && Math.max(Math.max(lastAppUsage.call_count, lastAppUsage.total_cputime), lastAppUsage.total_time) > 80) {
                Sys.println('Reaching API limit\n' + Json.stringify(lastAppUsage, null, "  "));
                return Promise.resolve(null);
            }
            var oldest = getOldestFile();
            return updateFile(oldest)
                .then(_ -> updateOldest())
                .catchError(err -> trace(err));
        }

        updateOldest();
    }

    static function main():Void {
        switch (Sys.args()) {
            case ["updateMeta"]:
                updateMeta();
            case _:
                throw "Unknown args";
        }
    }
}