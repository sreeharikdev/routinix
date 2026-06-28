import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinix/pages/login.dart';
import 'package:routinix/providers/usage_provider.dart';

void main(){
  runApp(ChangeNotifierProvider(create: (_)=>UsageProvider()..loadUsageData(),
  child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login(),);
  }
}