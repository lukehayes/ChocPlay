package sim.system;

import choc.system.System;


class BasicSystem extends System
{
    public function new()
    {
        super("Basic");
    }

    public function update(dt:Float)
    {
        trace("Updating Basic System");
    }
}
