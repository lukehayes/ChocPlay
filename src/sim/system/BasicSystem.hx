package sim.system;

import choc.system.System;
import sim.components.TransformComponent;


class BasicSystem extends System
{
    var g : h2d.Graphics;
    var scene:h2d.Scene;
    var cam:h2d.Camera;

    public function new(app:hxd.App)
    {
        super("Basic");
        scene = new h2d.Scene();
        g = new h2d.Graphics(this.scene);
        app.setScene(scene);
        cam = new h2d.Camera(scene);
        scene.addCamera(cam);
        cam.scale(0.5, 0.5);

        this.requires("Transform");
    }

    public function update(dt:Float)
    {
        this.filterEntities();

        g.clear();
        for(entity in this.filteredEntities)
        {
            trace("Drawing");
            var t = cast(entity.getComponent("Transform"), TransformComponent);
            trace(t.x);

            g.beginFill(t.color);
                g.drawRect(t.x, t.y, t.w,t.h);
            g.endFill();
        }

        this.filteredEntities = [];
    }
}
