import 'package:shared_preferences/shared_preferences.dart';

class UsageStorageService {
  
  static const String _keyEstimatedUsage = 'estimated_phone_usage';
  static const String _keyFetchedUsage = 'fetched_phone_usage';
  
  Future<void> saveUsageData({
    required int estimated,
    required int fetched,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyEstimatedUsage, estimated);
    await prefs.setInt(_keyFetchedUsage, fetched);
  }

 
  Future<Map<String, int>> loadUsageData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    
    int estimated = prefs.getInt(_keyEstimatedUsage) ?? 0;
    int fetched = prefs.getInt(_keyFetchedUsage) ?? 0;

    return {'estimated': estimated, 'fetched': fetched};
  }
}
