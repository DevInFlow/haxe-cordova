package js.cordova.plugin;

@:enum abstract ImagePickerOutputType(Int){
	var FILE_URI = 0;
	var BASE64_STRING = 1;
}

typedef ImagePickerOptions = {
	?maximumImagesCount:Int,
	?width:Int,
	?height:Int,
	?quality:Int,
	?outputType:ImagePickerOutputType
}

@:native("window.imagePicker")
extern class TelerikImagePicker {
	public static function getPictures(success:Dynamic->Void, fail:Dynamic->Void, ?options:ImagePickerOptions):Void;
	public static function hasReadPermission(callback:Bool->Void):Void;
	public static function requestReadPermission():Void;
}
