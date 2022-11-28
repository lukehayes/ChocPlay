package sim.components;

import choc.component.Component;


class TransformComponent extends Component
{
    public var x = 10;
    public var y = 10;
    public var w = 10;
    public var h = 10;
    public var color = 0x00FF00;

    public function new(x,y)
    {
        super("Transform");
        this.x = x;
        this.y = y;
    }
}
