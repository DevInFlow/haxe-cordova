package js.cordova.plugin;


@:enum abstract Format(String) to String{
}
@:enum abstract Orientation(String) to String{
    var landscape = 'landscape';
    var portrait = 'portrait';
}
@:enum abstract EncodingType(String) to String{
    var TEXT_TYPE = 'TEXT_TYPE';
    var EMAIL_TYPE = 'EMAIL_TYPE';
    var PHONE_TYPE = 'PHONE_TYPE';
    var SMS_TYPE = 'SMS_TYPE';
}
typedef BarcodeScannerConfig = {
?preferFrontCamera:Bool,
?showFlipCameraButton:Bool,
?showTorchButton:Bool,
?torchOn:Bool,
?saveHistory:Bool,
?prompt:String,
?resultDisplayDuration:Int,
?formats:String,
?orientation:Orientation,
?disableAnimations:Bool,
?disableSuccessBeep:Bool
}

@:enum abstract BarcodeFormat(String) to String{
    var AZTEC = 'AZTEC';
    var CODABAR = 'CODABAR';
    var CODE_39 = 'CODE_39';
    var CODE_93 = 'CODE_93';
    var CODE_128 = 'CODE_128';
    var DATA_MATRIX = 'DATA_MATRIX';
    var EAN_8 = 'EAN_8';
    var EAN_13 = 'EAN_13';
    var ITF = 'ITF';
    var MAXICODE = 'MAXICODE';
    var PDF_417 = 'PDF_417';
    var QR_CODE = 'QR_CODE';
    var RSS_14 = 'RSS_14';
    var RSS_EXPANDED = 'RSS_EXPANDED';
    var UPC_A = 'UPC_A';
    var UPC_E = 'UPC_E';
    var All_1D = 'All_1D';
    var UPC_EAN_EXTENSION = 'UPC_EAN_EXTENSION';
    var MSI = 'MSI';
    var PLESSEY = 'PLESSEY';
}

typedef SuccessResult = {text:String, format:BarcodeFormat, cancelled:Bool};
typedef SuccessCallback = SuccessResult -> Void;
typedef ErrorCallback = Dynamic -> Void;

@:native("cordova.plugins.barcodeScanner")
extern class BarcodeScanner {
    public static function scan(successCallback:SuccessCallback, errorCallback:ErrorCallback, ?config:BarcodeScannerConfig):Void;
    public static function encode(type:EncodingType, data:String, successCallback:SuccessCallback, errorCallback:ErrorCallback, config:BarcodeScannerConfig):Void;

}
