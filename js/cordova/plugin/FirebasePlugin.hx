package js.cordova.plugin;
@:native("window.FirebasePlugin")
extern class FirebasePlugin {
    public static function getToken(successCallback:String->Void,errorCallback:Dynamic->Void):Void;
    public static function getInfo(callback:String->Void):Void;
    public static function onTokenRefresh(successCallback:String->Void,errorCallback:Dynamic->Void):Void;
    public static function onNotificationOpen(successCallback:String->Void,errorCallback:Dynamic->Void):Void;
    public static function grantPermission():Void;
    public static function hasPermission(callback:Dynamic->Void):Void;
    public static function setBadgeNumber(value:Int):Void;
    public static function clearAllNotifications():Void;
    public static function getBadgeNumber(callback:Int->Void):Void;
    public static function subscribe(topic:String):Void;
    public static function unsubscribe(topic:String):Void;
    public static function unregister():Void;
}
