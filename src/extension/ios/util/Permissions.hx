package extension.ios.util;

#if lime
import lime.system.CFFI;
#end

class Permissions {
	public static inline VAR CAMERA:String = "camera";
	public static inline VAR PHOTOS:String = "photos";
	public static inline VAR MICROPHONE:String = "microphone";
	public static inline VAR LOCATION:String = "location";
	public static inline VAR NOTIFICATIONS:String = "notifications";
	public static inline VAR CONTACTS:String = "contacts";
	public static inline VAR CALENDAR:String = "calendar";

	public static inline VAR NOT_DETERMINED:Int = 0;
	public static inline VAR RESTRICTED:Int = 1;
	public static inline VAR DENIED:Int = 2;
	public static inline VAR AUTHORIZED:Int = 3;
	public static inline VAR LIMITED:Int = 4;

	#if (ios || mac || macos)
	private static var iostools_permissions_check = CFFI.load("extension-iostools", "iostools_permissions_check", 1);
	private static var iostools_permissions_request = CFFI.load("extension-iostools", "iostools_permissions_request", 2);
	private static var iostools_permissions_is_granted = CFFI.load("extension-iostools", "iostools_permissions_is_granted", 1);
	#end

	public static function check(permission:String):Int {
		#if (ios || mac || macos)
		if (iostools_permissions_check != null) {
			return iostools_permissions_check(permission);
		}
		#end
		return NOT_DETERMINED;
	}

	public static function request(permission:String, onResult:Int->Void):Void {
		#if (ios || mac || macos)
		if (iostools_permissions_request != null) {
			iostools_permissions_request(permission, function(status:Dynamic) {
				if (onResult != null) {
					onResult(Std.parseInt(Std.string(status)));
				}
			});
			return;
		}
		#end
		if (onResult != null) {
			onResult(DENIED);
		}
	}

	public static function isGranted(permission:String):Bool {
		#if (ios || mac || macos)
		if (iostools_permissions_is_granted != null) {
			return iostools_permissions_is_granted(permission) == true;
		}
		#end
		return false;
	}
}
