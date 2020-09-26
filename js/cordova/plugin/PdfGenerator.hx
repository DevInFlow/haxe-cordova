package js.cordova.plugin;
import js.lib.Promise;
@:native("cordova.require('cordova-pdf-generator')") extern class PdfGenerator {
	public static function fromURL(url:String, options:Dynamic):Promise<Dynamic>;
	public static function fromData(data:String, options:Dynamic):Promise<Dynamic>;
	public static function htmlToPDF(options:String, successCallback:Dynamic->Void, errorCallback:Dynamic->Dynamic):Promise<Dynamic>;
}
