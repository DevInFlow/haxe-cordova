package js.cordova.plugin;

typedef Position = {
?coors:{
lat:Dynamic,
lng:Dynamic,
alt:Dynamic,
acc:Dynamic,
head:Dynamic,
vel:Dynamic,
altacc:Dynamic
},
?timestamp:Float
}

typedef PositionError = {
code:Dynamic,
message:Dynamic
}

typedef GeolocationOptions = {
?maximumAge:Int,
?enableHighAccuracy:Bool,
?timeout:Int
};

typedef GeolocationSuccess = Position -> Void;
typedef GeolocationError = PositionError -> Void;
@:native("cordova.require('cordova-plugin-geolocation.geolocation')") extern class Geolocation {

    public function new();
    static public function getCurrentPosition(geolocationSuccess:GeolocationSuccess, ?geolocationError:GeolocationError, ?geolocationOptions:GeolocationOptions):Void;
    static public function watchPosition(geolocationSuccess:GeolocationSuccess, ?geolocationError:GeolocationError, ?geolocationOptions:GeolocationOptions):String;
    static public function clearWatch(id:String):Void;
}

