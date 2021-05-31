import 'package:flutter/material.dart';

Color mBackgroundColor = Color(0xFFFFFFFF);

Color mPrimaryColor = Color(0xFFB98068);

Color mPrimaryTextColor = Color(0xFF8C746A);

Color mSecondTextColor = Color(0xFFB98068);

Color mSecondColor = Color(0xFFC28E79);

Color mFacebookColor = Color(0xFF4277BC);

Color mTitleTextColor = Color(0xFF2D140D);

Color mTexHeadLoginColor = Color(0xFF0204E8);

Color borderEdittextColor = Color(0xFF4D4D4D);

Color borderFocusEdittextColor = Color(0xFF0000FF);

Color loginButtonColor = Color(0xFF556DD3);

List<String> coffeeNames = [
  'Espresso','Cappuccino','Macciato','Mocha','Latte',
];

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);