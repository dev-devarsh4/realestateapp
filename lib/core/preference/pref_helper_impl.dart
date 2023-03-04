import 'pref_constants.dart';
import 'pref_helper.dart';
import 'prefs.dart';

class PrefHelperImpl implements PrefHelper {
  @override
  String getDeviceId() => Prefs.getString(KEY_DEVICE_ID);

  @override
  Future<void> setDeviceId(String deviceId) =>
      Prefs.setString(KEY_DEVICE_ID, deviceId);

  @override
  int getAndroidVersion() => Prefs.getInt(ANDROID_VERSION, 0);

  @override
  Future<void> setAndroidVersion(int androidVersion) =>
      Prefs.setInt(ANDROID_VERSION, androidVersion);

  @override
  Future<void> setIOSVersion(double iosVersion) =>
      Prefs.setDouble(IOS_VERSION, iosVersion);

  @override
  double getIOSVersion() => Prefs.getDouble(IOS_VERSION, 0);

  @override
  Future<bool> clear() async {
    return await Prefs.clear();
  }
}
