import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_iot/screen/main/dashboard.dart';
import 'package:water_iot/screen/main/home.dart';
import 'package:water_iot/screen/main/setting.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  Widget _dashBoard = DashBoardPage();
  Widget _home = HomePage();
  Widget _setting = SettingPage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationBar Example"),
      ),
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text("Tổng quan"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text("Trang chủ"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Thông tin cá nhân"),
          )
        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._dashBoard;
    } else if (this.selectedIndex == 1) {
      return this._home;
    } else {
      return this._setting;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
