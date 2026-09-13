package extension.ios.media;

#if lime
import lime.system.CFFI;
#end

class Media {
	#if (ios || mac || macos)
	private static var iostools_media_play_sound = CFFI.load("extension-iostools", "iostools_media_play_sound", 1);
	private static var iostools_media_stop_sound = CFFI.load("extension-iostools", "iostools_media_stop_sound", 0);
	private static var iostools_media_set_volume = CFFI.load("extension-iostools", "iostools_media_set_volume", 1);
	private static var iostools_media_get_volume = CFFI.load("extension-iostools", "iostools_media_get_volume", 0);
	private static var iostools_media_is_playing = CFFI.load("extension-iostools", "iostools_media_is_playing", 0);
	#end

	public static function playSound(filePath:String):Bool {
		#if (ios || mac || macos)
		if (iostools_media_play_sound != null) {
			return iostools_media_play_sound(filePath) == true;
		}
		#end
		return false;
	}

	public static function stopSound():Void {
		#if (ios || mac || macos)
		if (iostools_media_stop_sound != null) {
			iostools_media_stop_sound();
		}
		#end
	}

	public static function setVolume(volume:Float):Void {
		#if (ios || mac || macos)
		if (iostools_media_set_volume != null) {
			iostools_media_set_volume(volume);
		}
		#end
	}

	public static function getVolume():Float {
		#if (ios || mac || macos)
		if (iostools_media_get_volume != null) {
			var vol:Dynamic = iostools_media_get_volume();
			if (vol != null) {
				return Std.parseFloat(Std.string(vol));
			}
		}
		#end
		return 0.0;
	}

	public static function isPlaying():Bool {
		#if (ios || mac || macos)
		if (iostools_media_is_playing != null) {
			return iostools_media_is_playing() == true;
		}
		#end
		return false;
	}
}
