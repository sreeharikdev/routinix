import 'package:flutter/foundation.dart';
import 'package:routinix/services/app_usage_service.dart';
import 'package:routinix/services/usage_storage_service.dart';

class UsageProvider extends ChangeNotifier {
  final UsageStorageService _storageService=UsageStorageService();
  final AppUsageService _appUsageService=AppUsageService();

  int estimatedUsage=0;

  int fetchedUsage=0;

  Future <void> loadUsageData() async{
    final savedData=await _storageService.loadUsageData();

    estimatedUsage=savedData['estimated']??0;
    fetchedUsage=savedData['fetched']??0;

    notifyListeners();
  }

  Future <void> updateEstimatedUsage(int value)async{
    estimatedUsage=value;

    await _storageService.saveUsageData(estimated: estimatedUsage, fetched: fetchedUsage);
    notifyListeners();

  }

  Future <void> updateFetchedUsage(int value)async{
    fetchedUsage=value;

    await _storageService.saveUsageData(estimated: estimatedUsage, fetched: fetchedUsage);
    notifyListeners();
  }

  Future<void> fetchAndUpdateScreenTime() async {
  try {
    final value = await _appUsageService.getScreenTimeData();
    await updateFetchedUsage(value);
  } catch (exception) {
    debugPrint("Failed to fetch screen time: $exception");
  }
}

  

}