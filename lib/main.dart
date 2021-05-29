import 'package:flutter/material.dart';
import 'package:water_iot/constants.dart';
import 'package:water_iot/screen/login/login_screen.dart';
import 'screen/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phúc Thịnh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: mBackgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

