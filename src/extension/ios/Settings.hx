package extension.ios;

#if lime
import lime.system.CFFI;
#end

class Settings {
	#if (ios || mac || macos)
	private static var iostools_settings_open_app_settings = CFFI.load("extension-iostools", "iostools_settings_open_app_settings", 0);
	private static var iostools_settings_open_url = CFFI.load("extension-iostools", "iostools_settings_open_url", 1);
	private static var iostools_settings_can_open_url = CFFI.load("extension-iostools", "iostools_settings_can_open_url", 1);
	private static var iostools_settings_set_user_default = CFFI.load("extension-iostools", "iostools_settings_set_user_default", 2);
	private static var iostools_settings_get_user_default = CFFI.load("extension-iostools", "iostools_settings_get_user_default", 1);
	private static var iostools_settings_remove_user_default = CFFI.load("extension-iostools", "iostools_settings_remove_user_default", 1);
	#end

	public static function openAppSettings():Bool {
		#if (ios || mac || macos)
		if (iostools_settings_open_app_settings != null) {
			return iostools_settings_open_app_settings() == true;
		}
		#end
		return false;
	}

	public static function openURL(url:String):Bool {
		#if (ios || mac || macos)
		if (iostools_settings_open_url != null) {
			return iostools_settings_open_url(url) == true;
		}
		#end
		return false;
	}

	public static function canOpenURL(url:String):Bool {
		#if (ios || mac || macos)
		if (iostools_settings_can_open_url != null) {
			return iostools_settings_can_open_url(url) == true;
		}
		#end
		return false;
	}

	public static function setUserDefault(key:String, value:Dynamic):Void {
		#if (ios || mac || macos)
		if (iostools_settings_set_user_default != null) {
			iostools_settings_set_user_default(key, Std.string(value));
		}
		#end
	}

	public static function getUserDefault(key:String):String {
		#if (ios || mac || macos)
		if (iostools_settings_get_user_default != null) {
			var result:Dynamic = iostools_settings_get_user_default(key);
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "";
	}

	public static function removeUserDefault(key:String):Void {
		#if (ios || mac || macos)
		if (iostools_settings_remove_user_default != null) {
			iostools_settings_remove_user_default(key);
		}
		#end
	}
}
