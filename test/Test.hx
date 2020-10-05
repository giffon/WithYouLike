import charleywong.EntityIndex;
import haxe.io.*;

class Test {
    static function main():Void {
        var index = EntityIndex.loadFromDirectory("data/entity");
        var tests:Array<utest.Test> = [
            new TestAllEntities(index),
            new TestSchema(),
            new TestTags(),
            new TestHkbaseDirectory(index),
        ];
        switch (Sys.args()) {
            case [] | ["push"]:
                utest.UTest.run(tests);
            case ["post-deployment"]:
                utest.UTest.run([new TestPostDeployment()]);
            case ["schedule"]:
                utest.UTest.run(tests.concat([
                    new TestUrls(index),
                ]));
            case args:
                throw 'Unkown args $args';
        }
    }
}