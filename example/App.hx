
import js.Browser.document;
import js.Browser.window;

@:build(om.MethodProfiler.profile(true))
class MyApp {

    public function new() {}

    public function doSomething( n = 10000000 ) {
		var q = 0.0;
		for( i in 0...n )
            q += 3.14159;
	}

    //@profile
	public function doSomethingElse( x : Int ) : Float {
		try {
			if( x == 0 )
				return 0;
			else if( x == 1 )
				throw "derp";
		} catch(e:String) {
			return 1;
		}
		return switch x {
		case 2: 2;
		case 3: 3;
		default: 4;
		}
	}
}

@:build(om.MethodProfiler.profile(true))
class AnotherApp {

    public function new() {}

    public function doSomething( n = 10000000 ) {
		var q = 0.0;
		for( i in 0...n )
            q += 3.14159;
	}

    //@profile
	public function doSomethingElse( x : Int ) : Float {
		try {
			if( x == 0 )
				return 0;
			else if( x == 1 )
				throw "derp";
		} catch(e:String) {
			return 1;
		}
		return switch x {
		case 2: 2;
		case 3: 3;
		default: 4;
		}
	}
}

class App {

    static var gui : om.MethodProfilerGUI;

    static var myApp : MyApp;
    static var anotherApp : AnotherApp;

    @noProfile
    static function update( time : Float ) {

        window.requestAnimationFrame( update );

        myApp.doSomething();
        myApp.doSomethingElse(0);
        myApp.doSomethingElse(1);
        myApp.doSomethingElse(2);

        anotherApp.doSomething();
        anotherApp.doSomethingElse(0);
        anotherApp.doSomethingElse(1);
        anotherApp.doSomethingElse(2);

        gui.addData();
    }

    @noProfile
    static function main() {

        //om.MethodProfiler.debug = true;

        gui = new om.MethodProfilerGUI( document.body );

        myApp = new MyApp();
        anotherApp = new AnotherApp();

        window.requestAnimationFrame( update );
    }
}
