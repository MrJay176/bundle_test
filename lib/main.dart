import 'package:bundle_test/Screens/HomePage.dart';
import 'package:bundle_test/Screens/ListUsers.dart';
import 'package:bundle_test/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      home:Splash(),
    );
  }
}

