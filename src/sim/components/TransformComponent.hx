package sim.components;

import choc.component.Component;


class TransformComponent extends Component
{
    public var x : Float =  10;
    public var y : Float =  10;
    public var w = 10;
    public var h = 10;
    public var dx = 1;
    public var dy = 1;
    public var speed = 300;
    public var color = 0x00FF00;

    public function new(x,y)
    {
        super("Transform");
        this.x = x;
        this.y = y;
    }
}
