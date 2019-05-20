package js.cordova.plugin;
@:native("QRScanner")

extern class QRScanner {
    public function new():Void;
    public static function prepare(callback:Dynamic):Void;
    public static function scan(callback:Dynamic):Void;
    public static function show():Void;
}
