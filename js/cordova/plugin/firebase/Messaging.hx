package js.cordova.plugin.firebase;

@:native("cordova.plugins.firebase.messaging") extern class Messaging {
	public static function onMessage(callback:String->Void):Void;
	public static function subscribe(topic:String):Void;
	public static function unsubscribe(topic:String):Void;
	public static function onBackgroundMessage(callback:String->Void):Void;
	public static function requestPermission(?options:{forceShow:Bool}):js.lib.Promise<Dynamic>;
	public static function getToken():js.lib.Promise<String>;
	public static function revokeToken():js.lib.Promise<Void>;
}
