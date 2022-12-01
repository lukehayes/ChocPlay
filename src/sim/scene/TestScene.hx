package sim.scene;


class TestScene extends h2d.Scene
{
    public var g : h2d.Graphics;


    public function new()
    {
        super();

        g = new h2d.Graphics(this);

        trace("Loaded Test Scene");
    }

    public function update(dt:Float)
    {
        trace("Updating Test Scenee");
    }
}
