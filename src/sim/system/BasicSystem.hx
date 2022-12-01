package sim.system;

import choc.system.System;
import sim.components.TransformComponent;
import sim.scene.TestScene;


class BasicSystem extends System
{
    var scene:TestScene;
    var app: hxd.App;

    public function new(app:hxd.App)
    {
        super("Basic");
        scene = new TestScene();
        this.app = app;
        this.app.setScene(scene);

        this.requires("Transform");
    }

    public function update(dt:Float)
    {
        this.filterEntities();

        scene.g.clear();
        for(entity in this.filteredEntities)
        {
            var t = cast(entity.getComponent("Transform"), TransformComponent);

            t.x += t.dx * t.speed * dt;
            t.y += t.dy * t.speed * dt;

            checkEdgeCollision(t);

            scene.g.beginFill(t.color);
                scene.g.drawRect(t.x, t.y, t.w,t.h);
            scene.g.endFill();
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
