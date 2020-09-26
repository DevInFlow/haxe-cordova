package js.cordova.plugin;

import haxe.extern.EitherType;

typedef Network = {
	level:String,
	SSID:String,
	BSSID:String,
	frequency:Int,
	capabilities:Int,
	timestamp:Int,
	channelWidth:Int,
	centerFreq0:Int,
	centerFreq1:Int
}

@:native("WifiWizard2")
extern class WifiWizard2 {
	public static function getConnectedSSID():String;
	public static function getConnectedBSSID():String;
	public static function timeout(delay:Int):Void;
	public static function iOSConnectNetwork(ssid:String, ssidPassword:String):Void;
	public static function iOSDisconnectNetwork(ssid:String):Void;
	public static function connect(ssid:String, ?bindAll:Bool, ?algorithm:String, ?password:String, ?isHiddenSSID:Bool):Void;
	public static function disconnect(?ssid:EitherType<String, Int>):Void;
	public static function formatWifiConfig(ssid:String, ?password:String, ?algorithm:String, ?isHiddenSSID:Bool):Void;
	public static function formatWPAConfig(ssid:String, ?password:String, ?isHiddenSSID:Bool):Void;
	public static function add(wifi:Dynamic):Void;
	public static function remove(ssid:String):Void;
	public static function listNetworks():js.lib.Promise<Dynamic>;
	public static function scan():js.lib.Promise<Array<Network>>;
}
