import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_iot/screen/customer/customer.dart';
import 'package:water_iot/screen/factory/factory_admin.dart';
import 'package:water_iot/screen/login/login.dart';
import 'package:water_iot/screen/signup/signup.dart';
import 'package:water_iot/test.dart';
import 'screen/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'PTEWATER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.redAccent,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.redAccent,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          ),
        ),
      ),
      // home: DetailSensorPage(),
      initialRoute:'/',
      routes: {
        '/': (context) =>SplashScreen(),
        '/login': (context) =>LoginPage(),
        '/factoryAdmin': (context) =>FactoryAminPage(),
        '/customer': (context) =>CustomerPage(),
        '/signup': (context) =>SignUpPage(),
      },
    );
  }
}

