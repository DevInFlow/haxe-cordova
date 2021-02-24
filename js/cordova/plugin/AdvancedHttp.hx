package js.cordova.plugin;

@:enum abstract DataSerializer(String) to String {
	var URL_ENCODED = 'urlencoded';
	var JSON = 'json';
	var UTF_8 = 'utf8';
	var MULTIPART = 'multipart';
	var RAW = 'raw';
}

@:enum abstract ServerTrustMode(String) to String {
	var DEFAULT = 'default';
	var LEGACY = 'legacy';
	var NO_CHECK = 'nocheck';
	var PINNED = 'pinned';
}

@:enum abstract ClientAuthMode(String) to String {
	var NONE = 'none';
	var SYSTEM_STORE = 'systemstore';
	var BUFFER = 'buffer';
}

@:enum abstract RequestMethod(String) to String {
	var GET = 'get';
	var POST = 'post';
	var PUT = 'put';
	var PATCH = 'patch';
	var HEAD = 'head';
	var DELETE = 'delete';
	var OPTIONS = 'options';
	var UPLOAD = 'upload';
	var DOWNLOAD = 'download';
}

typedef RequestOptions = {
	?method:RequestMethod,
	?data:Dynamic,
	?params:Dynamic,
	?serializer:String,
	?timeout:Float,
	?followRedirect:Bool,
	?headers:Dynamic,
	?filePath:String,
	?name:String
}

@:native("cordova.plugin.http")
extern class AdvancedHttp {
	public static function getBasicAuthHeader(user:String, password:String):Dynamic;
	public static function useBasicAuth(user:String, password:String):Void;

	@:overload(function(header:String, value:String):Void {})
	public static function setHeader(hostname:String, header:String, value:String):Void;
	public static function setDataSerializer(dataSerializer:DataSerializer):Void;
	public static function setRequestTimeout(second:Float):Void;
	public static function setFollowRedirect(value:Bool):Void;
	public static function getCookieString(url:String):String;
	public static function setCookie(url:String, cookie:String, options:Dynamic):Void;
	public static function clearCookies():Void;
	public static function setServerTrustMode(mode:ServerTrustMode, success:Void->Void, fail:Void->Void):Void;
	public static function setClientAuthMode(mode:ClientAuthMode, options:Dynamic, success:Void->Void, fail:Void->Void):Void;

	public static function removeCookies(url:String, callback:Void->Void):Void;
	public static function sendRequest(url:String, options:RequestOptions, success:Dynamic->Void, fail:Dynamic->Void):Void;
	public static function post(url:String, data:Dynamic, header:Dynamic, success:Dynamic->Void, fail:Dynamic->Void):Void;
	public static function get(url:String, data:Dynamic, header:Dynamic, success:Dynamic->Void, fail:Dynamic->Void):Void;
	public static function uploadFile(url:String, data:Dynamic, header:Dynamic, filePath:String, fileName:String, success:Dynamic->Void,
		fail:Dynamic->Void):Void;
}
