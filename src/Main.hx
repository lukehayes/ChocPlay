package;

import choc.World;
import Random;

class Main extends hxd.App {

    var g : h2d.Graphics;
    var world : World;

    override function init() {
        world = World.instance;

        var e = new sim.BasicEntity();
        e.addComponent("Transform", new sim.components.TransformComponent());

        world.addEntity(1, e);
        world.addSystem(new sim.system.BasicSystem(this));
    }

    override function update(dt:Float) 
    {
        world.update(dt);
    }

    static function main() {
        new Main();
    }

}
