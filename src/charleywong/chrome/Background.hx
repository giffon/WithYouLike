package charleywong.chrome;

import haxe.*;
import haxe.io.Path;
import js.lib.Promise;
import js.Browser.*;
import chrome.*;
using Lambda;

class Background {
    static function fetchEntityIndex():Promise<EntityIndex> return new Promise(function(resolve, reject) {
        Settings.getSettings().then(function(settings) {
            var jsonUrl = Path.join([settings.serverEndpoint, "list", "all.json"]);
            window.fetch(jsonUrl)
                .then(r -> r.json())
                .then((a:Array<Dynamic>) -> a.map(Entity.fromJson))
                .then(function(entities:Array<Entity>) {
                    resolve(new EntityIndex([for (e in entities) e.id => e]));
                })
                .catchError(function(err) {
                    console.error('Failed to fetch $jsonUrl');
                    reject(err);
                });
        });
    });

    static var entityIndex:Promise<EntityIndex> = new Promise(function(resolve, reject) {
        Storage.local.get(["entities"], function(results) {
            if (results.entities != null) {
                var index = new EntityIndex([
                    for (e in (results.entities:Array<Dynamic>).map(Entity.fromJson))
                    e.id => e
                ]);
                resolve(index);
                return;
            }

            fetchEntityIndex().then(function(index) {
                Storage.local.set({ entities: index.entities.map(e -> e.toJson()) });
                resolve(index);
            })
            .catchError(reject);
        });
    });

    static function onMessage(?request:Dynamic, sender, sendResponse:Dynamic->Void) {
        switch (request:{ call:String, args:Array<Dynamic> }) {
            case { call: "getEntityFromFb", args: [fb] }:
                entityIndex.then(function(index) {
                    switch (index.entitiesOfFbPage[fb]) {
                        case null:
                            sendResponse(false);
                        case e:
                            sendResponse(e.toJson());
                    }
                });
                return true;
            case _:
                throw 'Unknown request: $request';
        }
    }

    static function onStorageChanged(changes:DynamicAccess<{oldValue:Dynamic, newValue:Dynamic}>, namespace):Void {
        for (key => change in changes) {
            switch (key) {
                case "serverEndpoint":
                    entityIndex = fetchEntityIndex();
                case _:
                    // pass
            }
        }
    }

    static function main():Void {
        Runtime.onMessage.addListener(onMessage);
        Storage.onChanged.addListener(onStorageChanged);
    }
}