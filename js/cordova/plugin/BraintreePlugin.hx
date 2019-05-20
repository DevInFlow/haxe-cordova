package js.cordova.plugin;
@:native("BraintreePlugin") extern class BraintreePlugin {
    public static function initialize(token:String, successCallback:Dynamic -> Void, failureCallback:Dynamic -> Void):Void;
    public static function setupApplePay(options:Dynamic, successCallback:Dynamic -> Void, failureCallback:Dynamic -> Void):Void;
    public static function presentDropInPaymentUI(options:Dynamic, successCallback:Dynamic -> Void, failureCallback:Dynamic -> Void):Void;
}
