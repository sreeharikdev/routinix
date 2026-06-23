import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';

class Hourinput extends StatefulWidget {
  const Hourinput({super.key});

  @override
  State<Hourinput> createState() => _HourinputState();
}

class _HourinputState extends State<Hourinput> {

List<AppUsageInfo> _usagestats=[];

Future<void>  getScreenTimeData() async{
  try {
    DateTime endDate = DateTime.now();
  DateTime startDate = endDate.subtract(const Duration(hours: 24));

  AppUsage appUsage = AppUsage();
  List<AppUsageInfo> infoList = await appUsage.getAppUsage(startDate, endDate);

  setState(() {
    _usagestats=infoList;
  });
    
  } catch (exception) {
    print("Failed to fetch screen time: $exception");
  }
} 
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}