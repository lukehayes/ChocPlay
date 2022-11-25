package sim.component;

import choc.component.Component;


class TransformComponent extends Component
{
    public var x = 10;
    public var y = 10;
    public var color = 0x00FF00;

    public function new()
    {
        super("Transform");
    }
}
