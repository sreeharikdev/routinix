import 'package:shared_preferences/shared_preferences.dart';

class UsageStorageService {
  // Constants for storage keys to avoid typos
  static const String _keyEstimatedUsage = 'estimated_phone_usage';
  static const String _keyFetchedUsage = 'fetched_phone_usage';
  // Save values to local storage
  Future<void> saveUsageData({
    required int estimated,
    required int fetched,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyEstimatedUsage, estimated);
    await prefs.setInt(_keyFetchedUsage, fetched);
  }

  // Load values from local storage
  Future<Map<String, int>> loadUsageData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Using ?? 0 ensures non-nullable defaults if no data exists yet
    int estimated = prefs.getInt(_keyEstimatedUsage) ?? 0;
    int fetched = prefs.getInt(_keyFetchedUsage) ?? 0;

    return {'estimated': estimated, 'fetched': fetched};
  }
}
