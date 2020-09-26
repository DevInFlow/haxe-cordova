package js.cordova.plugin;
/**
	Extern for the [cordova-plugin-fullscreen](https://github.com/mesmotronic/cordova-plugin-fullscreen) plugin.
**/
/**

	SYSTEM_UI_FLAG_FULLSCREEN: 4,
	SYSTEM_UI_FLAG_HIDE_NAVIGATION: 2,
	SYSTEM_UI_FLAG_IMMERSIVE: 2048,
	SYSTEM_UI_FLAG_IMMERSIVE_STICKY: 4096,
	SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN: 1024,
	SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION: 512,
	SYSTEM_UI_FLAG_LAYOUT_STABLE: 256,
	SYSTEM_UI_FLAG_LIGHT_STATUS_BAR: 8192,
	SYSTEM_UI_FLAG_LOW_PROFILE: 1,
	SYSTEM_UI_FLAG_VISIBLE: 0,
**/
@:enum abstract SystemUiFlag(Int) {
	var FULLSCREEN = 4;
	var HIDE_NAVIGATION = 2;
	var IMMERSIVE = 2048;
	var IMMERSIVE_STICKY = 4096;
	var LAYOUT_FULLSCREEN = 1024;
	var LAYOUT_HIDE_NAVIGATION = 512;
	var LAYOUT_STABLE = 256;
	var LIGHT_STATUS_BAR = 8192;
	var LOW_PROFILE = 1;
	var VISIBLE = 0;
}

@:native("window.AndroidFullScreen")
extern class AndroidFullScreen {
	static public function isSupported(successCallback:Void->Void, errorCallback:Dynamic->Void):String;
	static public function isImmersiveModeSupported(successCallback:Void->Void, errorCallback:Dynamic->Void):String;
	static public function immersiveWidth(successCallback:Dynamic->Void, errorCallback:Dynamic->Void):String;
	static public function immersiveHeight(successCallback:Dynamic->Void, errorCallback:Dynamic->Void):String;
	static public function leanMode(successCallback:Void->Void, errorCallback:Dynamic->Void):String;
	static public function showSystemUI(successCallback:Void->Void, errorCallback:Dynamic->Void):String;
	static public function showUnderStatusBar(successCallback:Void->Void, errorCallback:Dynamic->Void):String;
	static public function showUnderSystemUI(successCallback:Void->Void, errorCallback:Dynamic->Void):String;
	static public function immersiveMode(successCallback:Void->Void, errorCallback:Dynamic->Void):String;
	static public function setSystemUiVisibility(uiFlag:SystemUiFlag, successCallback:Void->Void, errorCallback:Dynamic->Void):String;
}
