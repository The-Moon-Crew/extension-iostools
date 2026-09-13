package extension;

#if lime
import lime.system.CFFI;
#end

class Iphone {
	#if ios
	private static var iostools_check_permission = CFFI.load("extension-iostools", "iostools_check_permission", 1);
	private static var iostools_request_permission = CFFI.load("extension-iostools", "iostools_request_permission", 2);
	private static var iostools_get_system_version = CFFI.load("extension-iostools", "iostools_get_system_version", 0);
	private static var iostools_vibrate = CFFI.load("extension-iostools", "iostools_vibrate", 1);
	private static var iostools_open_settings = CFFI.load("extension-iostools", "iostools_open_settings", 0);
	#end

	public static function checkPermission(permission:String):Int {
		#if ios
		if (iostools_check_permission != null) {
			return iostools_check_permission(permission);
		}
		#end
		return 0;
	}

	public static function requestPermission(permission:String, onResult:Bool->Void):Void {
		#if ios
		if (iostools_request_permission != null) {
			iostools_request_permission(permission, function(status:Dynamic) {
				if (onResult != null) {
					onResult(status == true || status == 1);
				}
			});
			return;
		}
		#end
		if (onResult != null) {
			onResult(false);
		}
	}

	public static function getSystemVersion():String {
		#if ios
		if (iostools_get_system_version != null) {
			var version:Dynamic = iostools_get_system_version();
			if (version != null) {
				return Std.string(version);
			}
		}
		#end
		return "Unknown";
	}

	public static function vibrate(style:String = "medium"):Void {
		#if ios
		if (iostools_vibrate != null) {
			iostools_vibrate(style);
		}
		#end
	}

	public static function openSettings():Void {
		#if ios
		if (iostools_open_settings != null) {
			iostools_open_settings();
		}
		#end
	}
}
