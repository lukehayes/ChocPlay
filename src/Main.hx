package;

import choc.World;
import Random;

class Main extends hxd.App {

    var g : h2d.Graphics;
    var world : World;

    override function init() {
        world = World.instance;

        world.addSystem(new sim.system.BasicSystem(this));

        var e1 = new sim.BasicEntity();
        e1.addComponent("Transform", new sim.components.TransformComponent(30,30));
        world.addEntity(1, e1);

        var e2 = new sim.BasicEntity();
        e2.addComponent("Transform", new sim.components.TransformComponent(130,330));
        world.addEntity(2, e2);

    }

    override function update(dt:Float) 
    {
        world.update(dt);
    }

    static function main() {
        new Main();
    }

}
