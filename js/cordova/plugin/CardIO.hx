package js.cordova.plugin;
typedef CardIOOptions = {
?requireExpiry:Bool,
?requireCVV:Bool,
?requirePostalCode:Bool,
?suppressManual:Bool,
?restrictPostalCodeToNumericOnly:Bool,
?keepApplicationTheme:Bool,
?requireCardholderName:Bool,
?scanInstructions:String,
?noCamera:Bool,
?scanExpiry:Bool,
?languageOrLocale:String,
?guideColor:String,
?suppressConfirmation:Bool,
?hideCardIOLogo:Bool,
?useCardIOLogo:Bool,
?suppressScan:Bool,


}
@:native("CardIO") extern class CardIO {
    public static function scan(options:CardIOOptions, onSuccess:Dynamic -> Void, onFailure:Dynamic -> Void):Void;
    public static function canScan(callback:Bool):Void;
    public static function version(callback:String -> Void):Void;
}
