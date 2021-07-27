import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/screen/main/dashboard.dart';
import 'package:water_iot/screen/main/home.dart';
import 'package:water_iot/screen/main/setting.dart';
import 'package:water_iot/screen/overview/overview.dart';

class MainPage extends StatefulWidget {
  // int _currentIndex;
  // MainPage(this._currentIndex, {Key key}): super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;
  final _pageOptions = [HomePage(), DashBoardPage(), SettingPage()];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: _pageOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: Color(0xFF556DD3),
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Tổng Quan',
            icon: SvgPicture.asset(
              "assets/images/ic_dashboard.svg",
              width: 20,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/ic_dashboard.svg",
              color: Color(0xFF556DD3),
              width: 20,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Bảng Điều Khiển',
            icon: SvgPicture.asset(
              "assets/images/ic_home.svg",
              width: 20,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/ic_home.svg",
              color: Color(0xFF556DD3),
              width: 20,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Tài Khoản',
            icon: SvgPicture.asset(
              "assets/images/ic_setting.svg",
              width: 20,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              "assets/images/ic_setting.svg",
              color: Color(0xFF556DD3),
              width: 20,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    textTheme: _buildShrineTextTheme(base.textTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
