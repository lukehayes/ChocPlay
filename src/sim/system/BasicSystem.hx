package sim.system;

import choc.system.System;
import sim.components.TransformComponent;


class BasicSystem extends System
{
    var g : h2d.Graphics;
    var scene:h2d.Scene;
    var cam:h2d.Camera;
    var app: hxd.App;

    public function new(app:hxd.App)
    {
        super("Basic");
        g = new h2d.Graphics(scene);
        scene = new h2d.Scene();
        this.app = app;
        this.app.setScene(scene);
        //cam = new h2d.Camera(scene);
        //scene.addCamera(cam);

        this.requires("Transform");
    }

    public function update(dt:Float)
    {
        this.filterEntities();

        g.clear();
        for(entity in this.filteredEntities)
        {
            var t = cast(entity.getComponent("Transform"), TransformComponent);

            g.beginFill(t.color);
                g.drawRect(t.x, t.y, t.w,t.h);
            g.endFill();
        }

        this.filteredEntities = [];
    }
}
