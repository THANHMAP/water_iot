import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_iot/model/login_model.dart';
import 'package:water_iot/screen/customer/customer.dart';
import 'package:water_iot/screen/factory/factory.dart';
import 'package:water_iot/screen/factory/factory_admin.dart';
import 'package:water_iot/screen/home/home_screen.dart';
import 'package:water_iot/screen/login/login.dart';
import 'package:water_iot/screen/login/login_screen.dart';
import 'package:water_iot/screen/main/main.dart';

import '../../SharedPref.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Data dataUser = Data();

  @override
  void initState() {
    var d = Duration(seconds: 3);
    // delayed 3 seconds to next page

    Future.delayed(d, () async {
      // to next page and close this page
      var user = await getUserInfo();
      if (user != null) {
        var screen;
        Group group = user.group.first;
        if (group.code == "super_admin_app") {
          screen = '/customer';
        } else if (group.code == "admin") {
          screen = '/factoryAdmin';
        } else if (group.code == "viewer") {
          screen = '/factoryAdmin';
        }else if (group.code == "admin_factory") {
          screen = '/factoryAdmin';
        }
        Navigator.pushNamed(context, screen);

      } else {
        Navigator.pushNamed(context, '/login');
      }
      // if (dataUser.accessToken != null) {
      // } else {

      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash_bg.jpg"),
                fit: BoxFit.fill)),
      ),
    );
  }
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  EnterExitRoute({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}
