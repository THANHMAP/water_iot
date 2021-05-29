import 'package:flutter/material.dart';
import 'package:water_iot/constants.dart';
import 'package:water_iot/screen/home/widget/login_and_register.dart';
import 'package:water_iot/screen/home/widget/login_with_facebook.dart';
import 'package:water_iot/screen/home/widget/slider_dot.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset('assets/images/coffee_time.png'),
          SliderDot(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Get the best coffee\nin town!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mPrimaryTextColor,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          LoginAndRegister(),
          LoginWithFacebook()
        ],
      ),
    );
  }
}

