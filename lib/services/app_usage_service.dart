import 'package:app_usage/app_usage.dart';


class AppUsageService {
    Future<int> getScreenTimeData() async {
   
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(const Duration(hours: 24));

      AppUsage appUsage = AppUsage();
      List<AppUsageInfo> infoList = await appUsage.getAppUsage(
        startDate,
        endDate,
      );

      int totalHours = 0;

      for (var info in infoList) {
        totalHours += info.usage.inHours;
      }
      
      
      return totalHours;
    
  }

  
}