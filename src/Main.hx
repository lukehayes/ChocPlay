package;

import choc.World;
import Random;

class Main extends hxd.App {

    var g : h2d.Graphics;
    var world : World;

    override function init() {
        world = World.instance;

        world.addSystem(new sim.system.BasicSystem(this));

        for(i in 1...10)
        {
            var e1 = new sim.BasicEntity();
            var t1 = new sim.components.TransformComponent(Random.int(1,i), Random.int(1,i));
            t1.dx = Random.int(-1,1);
            t1.dy = Random.int(-1,1);
            e1.addComponent("Transform", t1);
            world.addEntity(i, e1);
        }
    }

    override function update(dt:Float) 
    {
        world.update(dt);
    }

    static function main() {
        new Main();
    }

}
