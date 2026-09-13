package extension.ios;

#if lime
import lime.system.CFFI;
#end

class MacPermissions {
	#if (mac || macos || ios)
	private static var iostools_mac_check_permission = CFFI.load("extension-iostools", "iostools_mac_check_permission", 1);
	private static var iostools_mac_request_permission = CFFI.load("extension-iostools", "iostools_mac_request_permission", 2);
	private static var iostools_mac_open_privacy_settings = CFFI.load("extension-iostools", "iostools_mac_open_privacy_settings", 1);
	#end

	public static function checkPermission(permission:String):Int {
		#if (mac || macos || ios)
		if (iostools_mac_check_permission != null) {
			return iostools_mac_check_permission(permission);
		}
		#end
		return 0;
	}

	public static function requestPermission(permission:String, onResult:Bool->Void):Void {
		#if (mac || macos || ios)
		if (iostools_mac_request_permission != null) {
			iostools_mac_request_permission(permission, function(status:Dynamic) {
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

	public static function openPrivacySettings(pane:String = "general"):Void {
		#if (mac || macos || ios)
		if (iostools_mac_open_privacy_settings != null) {
			iostools_mac_open_privacy_settings(pane);
		}
		#end
	}
}
