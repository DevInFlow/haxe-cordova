package js.cordova.plugin.camera;

import js.cordova.plugin.camera.CameraEnums.CameraOptions;





/**
Extern for the [cordova-plugin-camera](https://github.com/apache/cordova-plugin-camera) plugin.
**/
@:native("navigator.camera")
extern class CameraPlugin {
	static public function getPicture(successCb:String->Void, errorCb:String->Void, options:CameraOptions):Void;
	static public function cleanup(successCb:Void->Void, errorCb:String->Void):Void;
}
