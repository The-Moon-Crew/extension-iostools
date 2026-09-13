package extension;

#if lime
import lime.system.CFFI;
#end

class Iphone {
	#if ios
	private static var iostools_check_permission = CFFI.load("extension-iostools", "iostools_check_permission", 1);
	private static var iostools_request_permission = CFFI.load("extension-iostools", "iostools_request_permission", 2);
	private static var iostools_get_system_version = CFFI.load("extension-iostools", "iostools_get_system_version", 0);
	private static var iostools_get_device_model = CFFI.load("extension-iostools", "iostools_get_device_model", 0);
	private static var iostools_vibrate = CFFI.load("extension-iostools", "iostools_vibrate", 1);
	private static var iostools_open_settings = CFFI.load("extension-iostools", "iostools_open_settings", 0);
	private static var iostools_get_battery_level = CFFI.load("extension-iostools", "iostools_get_battery_level", 0);
	private static var iostools_get_battery_state = CFFI.load("extension-iostools", "iostools_get_battery_state", 0);
	private static var iostools_is_low_power_mode = CFFI.load("extension-iostools", "iostools_is_low_power_mode", 0);
	private static var iostools_set_idle_timer_disabled = CFFI.load("extension-iostools", "iostools_set_idle_timer_disabled", 1);
	private static var iostools_get_screen_brightness = CFFI.load("extension-iostools", "iostools_get_screen_brightness", 0);
	private static var iostools_set_screen_brightness = CFFI.load("extension-iostools", "iostools_set_screen_brightness", 1);
	private static var iostools_is_jailbroken = CFFI.load("extension-iostools", "iostools_is_jailbroken", 0);
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

	public static function getDeviceModel():String {
		#if ios
		if (iostools_get_device_model != null) {
			var model:Dynamic = iostools_get_device_model();
			if (model != null) {
				return Std.string(model);
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

	public static function getBatteryLevel():Float {
		#if ios
		if (iostools_get_battery_level != null) {
			var level:Dynamic = iostools_get_battery_level();
			if (level != null) {
				return Std.parseFloat(Std.string(level));
			}
		}
		#end
		return -1.0;
	}

	public static function getBatteryState():Int {
		#if ios
		if (iostools_get_battery_state != null) {
			return iostools_get_battery_state();
		}
		#end
		return 0;
	}

	public static function isLowPowerMode():Bool {
		#if ios
		if (iostools_is_low_power_mode != null) {
			return iostools_is_low_power_mode() == true;
		}
		#end
		return false;
	}

	public static function setIdleTimerDisabled(disabled:Bool):Void {
		#if ios
		if (iostools_set_idle_timer_disabled != null) {
			iostools_set_idle_timer_disabled(disabled);
		}
		#end
	}

	public static function getScreenBrightness():Float {
		#if ios
		if (iostools_get_screen_brightness != null) {
			var brightness:Dynamic = iostools_get_screen_brightness();
			if (brightness != null) {
				return Std.parseFloat(Std.string(brightness));
			}
		}
		#end
		return 0.0;
	}

	public static function setScreenBrightness(brightness:Float):Void {
		#if ios
		if (iostools_set_screen_brightness != null) {
			iostools_set_screen_brightness(brightness);
		}
		#end
	}

	public static function isJailbroken():Bool {
		#if ios
		if (iostools_is_jailbroken != null) {
			return iostools_is_jailbroken() == true;
		}
		#end
		return false;
	}
}
