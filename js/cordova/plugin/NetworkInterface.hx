package js.cordova.plugin;

@:native("networkinterface")
extern class NetworkInterface {
	public static function getWiFiIPAddress(success:Dynamic->Void,?error:Dynamic->Void):Void;
	public static function getCarrierIPAddress(success:Dynamic->Void,?error:Dynamic->Void):Void;
	public static function getHttpProxyInformation(url:String,success:Dynamic->Void,?error:Dynamic->Void):Void;
}
