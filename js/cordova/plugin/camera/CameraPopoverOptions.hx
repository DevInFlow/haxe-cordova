package js.cordova.plugin.camera;

import js.cordova.plugin.camera.CameraEnums.CameraPopoverArrowDirection;

@:native("CameraPopoverOptions")
extern class CameraPopoverOptions {
	public function new(x:Int, y:Int, width:Int, height:Int, arrowDir:CameraPopoverArrowDirection);
}