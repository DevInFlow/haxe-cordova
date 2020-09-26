package js.cordova.plugin;

@:native("AudioToggle")
extern class AudioToggle{
    public static inline var SPEAKER:String = "speaker";
    public static inline var EARPIECE:String = "earpiece";
    public static inline var NORMAL:String = "normal";
    public static inline var RINGTONE:String = "ringtone";

    public static function setAudioMode(mode:String):Void;
}
