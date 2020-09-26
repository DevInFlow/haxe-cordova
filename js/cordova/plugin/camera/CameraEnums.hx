package js.cordova.plugin.camera;

@:enum
abstract CameraDirection(Int) {
	var Back = 0;
	var Front = 1;
}

@:enum
abstract CameraPopoverArrowDirection(Int) {
	var ArrowUp = 1;
	var ArrowDown = 2;
	var ArrowLeft = 4;
	var ArrowRight = 8;
	var ArrowAny = 15;
}

@:enum
abstract CameraSourceType(Int) {
	var PhotoLibrary = 0;
	var Camera = 1;
	var SavedPhotoAlbum = 2;
}

@:enum
abstract CameraMediaType(Int) {
	var Picture = 0;
	var Video = 1;
	var All = 2;
}

@:enum
abstract CameraEncodingType(Int) {
	var JPEG = 0;
	var PNG = 1;
}

@:enum
abstract CameraDestinationType(Int) {
	var DataUrl = 0;
	var FileUri = 1;
	var NativeUri = 2;
}

typedef CameraOptions = {
	?quality:Int,
	?destinationType:CameraDestinationType,
	?sourceType:CameraSourceType,
	?allowEdit:Bool,
	?encodingType:CameraEncodingType,
	?targetWidth:Int,
	?targetHeight:Int,
	?mediaType:CameraMediaType,
	?correctOrientation:Bool,
	?saveToPhotoAlbum:Bool,
	?popoverOptions:CameraPopoverOptions,
	?cameraDirection:CameraDirection,
}