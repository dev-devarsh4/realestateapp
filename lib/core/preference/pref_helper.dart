abstract class PrefHelper {
  String getDeviceId();

  Future<void> setDeviceId(String deviceId);

  int getAndroidVersion();

  Future<void> setAndroidVersion(int androidVersion);

  Future<void> setIOSVersion(double iosVersion);

  double getIOSVersion();

  Future<bool> clear();
}
