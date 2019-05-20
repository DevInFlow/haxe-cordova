package js.cordova.plugin;

@:native("window.plugins.OneSignal")
extern class OneSignal {
    public static function startInit(appId:String, ?googleProjectNumber:String):OneSignal;
    public static function handleNotificationReceived(handleNotificationReceivedCallback:Dynamic):OneSignal;
    public static function handleNotificationOpened(handleNotificationOpenedCallback:Dynamic):OneSignal;
    public static function inFocusDisplaying(display:Dynamic):OneSignal;
    public static function iOSSettings(settings:Dynamic):OneSignal;
    public static function endInit():Void;
    public static function setSubscription(enable:Bool):Void;
    public static function postNotification(jsonData:Dynamic,?onSuccess:Dynamic->Void,?onFailure:Dynamic->Void):Void;
    public static function promptLocation():Void;
    public static function addEmailSubscriptionObserver(cb:Dynamic->Void):Void;
    public static function addSubscriptionObserver(cb:Dynamic->Void):Void;
    public static function addPermissionObserver(cb:Dynamic->Void):Void;
    public static function removeExternalUserId():Void;
    public static function setExternalUserId(id:String):Void;
    public static function logoutEmail(successCallback:Dynamic->Void,errorCallback:Dynamic->Void):Void;
    public static function setEmail(email:String,successCallback:Void->Void,errorCallback:Dynamic->Void):Void;
    public static function registerForPushNotifications():Void;
    public static function sendTags(tags:Dynamic):Void;
    public static function getTags(callback:Dynamic->Void):Void;
    public static function deleteTags(tags:Array<String>):Void;
    public static function getIds(meth:Dynamic->Void,?successCallback:Void->Void,?errorCallback:Dynamic->Void):Void;
    public static function syncHashedEmail(email:String):Void;

}
