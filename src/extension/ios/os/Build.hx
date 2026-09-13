package extension.ios.os;

#if lime
import lime.system.CFFI;
#end

class Build {
	#if (ios || mac || macos)
	private static var iostools_build_get_bundle_id = CFFI.load("extension-iostools", "iostools_build_get_bundle_id", 0);
	private static var iostools_build_get_app_version = CFFI.load("extension-iostools", "iostools_build_get_app_version", 0);
	private static var iostools_build_get_build_number = CFFI.load("extension-iostools", "iostools_build_get_build_number", 0);
	private static var iostools_build_get_app_name = CFFI.load("extension-iostools", "iostools_build_get_app_name", 0);
	private static var iostools_build_is_debug = CFFI.load("extension-iostools", "iostools_build_is_debug", 0);
	private static var iostools_build_is_simulator = CFFI.load("extension-iostools", "iostools_build_is_simulator", 0);
	#end

	public static function getBundleId():String {
		#if (ios || mac || macos)
		if (iostools_build_get_bundle_id != null) {
			var result:Dynamic = iostools_build_get_bundle_id();
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "";
	}

	public static function getAppVersion():String {
		#if (ios || mac || macos)
		if (iostools_build_get_app_version != null) {
			var result:Dynamic = iostools_build_get_app_version();
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "1.0.0";
	}

	public static function getBuildNumber():String {
		#if (ios || mac || macos)
		if (iostools_build_get_build_number != null) {
			var result:Dynamic = iostools_build_get_build_number();
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "1";
	}

	public static function getAppName():String {
		#if (ios || mac || macos)
		if (iostools_build_get_app_name != null) {
			var result:Dynamic = iostools_build_get_app_name();
			if (result != null) {
				return Std.string(result);
			}
		}
		#end
		return "";
	}

	public static function isDebug():Bool {
		#if (ios || mac || macos)
		if (iostools_build_is_debug != null) {
			return iostools_build_is_debug() == true;
		}
		#end
		#if debug
		return true;
		#else
		return false;
		#end
	}

	public static function isSimulator():Bool {
		#if (ios || mac || macos)
		if (iostools_build_is_simulator != null) {
			return iostools_build_is_simulator() == true;
		}
		#end
		return false;
	}
}
