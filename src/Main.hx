package;

import choc.World;
import Random;

class Main extends hxd.App {

    var g : h2d.Graphics;
    var world : World;

    override function init() {
        g = new h2d.Graphics(s2d);
        world = World.instance;

        var e = new sim.BasicEntity(1);
        e.addComponent(new sim.components.TransformComponent());


        world.addSystem(new sim.system.BasicSystem());
    }

    override function update(dt:Float) 
    {
        world.update(dt);
    }

    static function main() {
        new Main();
    }

}
