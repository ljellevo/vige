package lib.core;

class DynamicComponent {

    public function setState(callback: haxe.Constraints.Function) {
        
        trace("SetState Called");
        callback();
    }
    
}