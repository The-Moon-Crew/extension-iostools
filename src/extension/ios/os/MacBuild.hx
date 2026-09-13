package extension.ios.os;

#if lime
import lime.system.CFFI;
#end

class MacBuild {
	#if (mac || macos)
	private static var iostools_mac_build_get_bundle_id = CFFI.load("extension-iostools", "iostools_mac_build_get_bundle_id", 0);
	private static var iostools_mac_build_get_app_version = CFFI.load("extension-iostools", "iostools_mac_build_get_app_version", 0);
	private static var iostools_mac_build_get_build_number = CFFI.load("extension-iostools", "iostools_mac_build_get_build_number", 0);
	private static var iostools_mac_build_get_app_name = CFFI.load("extension-iostools", "iostools_mac_build_get_app_name", 0);
	private static var iostools_mac_build_is_sandboxed = CFFI.load("extension-iostools", "iostools_mac_build_is_sandboxed", 0);
	private static var iostools_mac_build_get_os_version = CFFI.load("extension-iostools", "iostools_mac_build_get_os_version", 0);
	private static var iostools_mac_build_is_apple_silicon = CFFI.load("extension-iostools", "iostools_mac_build_is_apple_silicon", 0);
	#end

	public static function getBundleId():String {
		#if (mac || macos)
		if (iostools_mac_build_get_bundle_id != null) {
			var result:Dynamic = iostools_mac_build_get_bundle_id();
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "";
	}

	public static function getAppVersion():String {
		#if (mac || macos)
		if (iostools_mac_build_get_app_version != null) {
			var result:Dynamic = iostools_mac_build_get_app_version();
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "1.0.0";
	}

	public static function getBuildNumber():String {
		#if (mac || macos)
		if (iostools_mac_build_get_build_number != null) {
			var result:Dynamic = iostools_mac_build_get_build_number();
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "1";
	}

	public static function getAppName():String {
		#if (mac || macos)
		if (iostools_mac_build_get_app_name != null) {
			var result:Dynamic = iostools_mac_build_get_app_name();
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "";
	}

	public static function isSandboxed():Bool {
		#if (mac || macos)
		if (iostools_mac_build_is_sandboxed != null) {
			return iostools_mac_build_is_sandboxed() == true;
		}
		#end
		return false;
	}

	public static function getOSVersion():String {
		#if (mac || macos)
		if (iostools_mac_build_get_os_version != null) {
			var result:Dynamic = iostools_mac_build_get_os_version();
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "Unknown";
	}

	public static function isAppleSilicon():Bool {
		#if (mac || macos)
		if (iostools_mac_build_is_apple_silicon != null) {
			return iostools_mac_build_is_apple_silicon() == true;
		}
		#end
		return false;
	}
}
