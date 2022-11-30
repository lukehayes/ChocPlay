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
        scene = new h2d.Scene();
        this.app = app;
        this.app.setScene(scene);

        g = new h2d.Graphics(this.scene);
        cam = new h2d.Camera(scene);

        //scene.addCamera(cam);
        //cam.scale(0.5, 0.5);

        for(cam in scene.cameras)
        {
            trace("--");
            trace(cam);
        }

        this.requires("Transform");
    }

    public function update(dt:Float)
    {
        this.filterEntities();

        g.clear();
        for(entity in this.filteredEntities)
        {
            var t = cast(entity.getComponent("Transform"), TransformComponent);

            t.x += t.dx * t.speed * dt;
            t.y += t.dy * t.speed * dt;

            checkEdgeCollision(t);

            g.beginFill(t.color);
                g.drawRect(t.x, t.y, t.w,t.h);
            g.endFill();
        }

        this.filteredEntities = [];
    }

    private function checkEdgeCollision(t:TransformComponent)
    {
        if(t.x < 0 || t.x > app.engine.width)
        {
            t.dx = -t.dx;
        }

        if(t.y < 0 || t.y > app.engine.height)
        {
            t.dy = -t.dy;
        }

    }
}
