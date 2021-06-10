import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final String _fullName = "Nick Frost";
  final String _status = "Software Developer";
  final String _bio =
      "\"Hi, I am a Freelance developer working for hourly basis. If you wants to contact me to build your product leave a message.\"";
  final String _followers = "173";
  final String _posts = "24";
  final String _scores = "450";

  @override
  void initState() {
    super.initState();
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: 110.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img_setting.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/test.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Color(0xFF556DD3),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        "Lần truy cập gần nhất:",
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatusLogin(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        "1:11, 03/05/2021",
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainerInfoTinh() {
    return Container(
      height: 40.0,
      // margin: EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Color(0xFFB3B3B3)),
          // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
          // right: BorderSide(width: 1.0, color: Color(0xFF000000)),
          bottom: BorderSide(width: 0.5, color: Color(0xFFB3B3B3)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: SvgPicture.asset(
                  "assets/images/ic_tinh.svg",
                  width: 20,
                  height: 30,
                ),
              ),
              Expanded(
                flex: 50,
                child: Container(
                  margin: new EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    'Thông tin chung',
                    style: TextStyle(
                      color: textDashboardColor,
                      fontFamily: 'OpenSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // child: Center(
                  //
                  // ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Image.asset(
                    "assets/images/ic_arrow.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatContainerInfoPerson() {
    return Container(
      height: 40.0,
      // margin: EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Color(0xFFB3B3B3)),
          // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
          // right: BorderSide(width: 1.0, color: Color(0xFF000000)),
          bottom: BorderSide(width: 0.5, color: Color(0xFFB3B3B3)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: SvgPicture.asset(
                  "assets/images/ic_setting.svg",
                  width: 20,
                  height: 30,
                ),
              ),
              Expanded(
                flex: 50,
                child: Container(
                  margin: new EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    'Thông tin cá nhân',
                    style: TextStyle(
                      color: textDashboardColor,
                      fontFamily: 'OpenSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // child: Center(
                  //
                  // ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Image.asset(
                    "assets/images/ic_arrow.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatContainerChangePass() {
    return Container(
      height: 40.0,
      // margin: EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Color(0xFFB3B3B3)),
          // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
          // right: BorderSide(width: 1.0, color: Color(0xFF000000)),
          bottom: BorderSide(width: 0.5, color: Color(0xFFB3B3B3)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: SvgPicture.asset(
                  "assets/images/ic_change_pass.svg",
                  width: 20,
                  height: 30,
                ),
              ),
              Expanded(
                flex: 50,
                child: Container(
                  margin: new EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    'Đổi mật khẩu',
                    style: TextStyle(
                      color: textDashboardColor,
                      fontFamily: 'OpenSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // child: Center(
                  //
                  // ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Image.asset(
                    "assets/images/ic_arrow.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatContainerLogout() {
    return Container(
      height: 40.0,
      // margin: EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Color(0xFFB3B3B3)),
          // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
          // right: BorderSide(width: 1.0, color: Color(0xFF000000)),
          bottom: BorderSide(width: 0.5, color: Color(0xFFB3B3B3)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: SvgPicture.asset(
                  "assets/images/ic_logout.svg",
                  width: 20,
                  height: 30,
                ),
              ),
              Expanded(
                flex: 50,
                child: Container(
                  margin: new EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    'Đăng xuất',
                    style: TextStyle(
                      color: textDashboardColor,
                      fontFamily: 'OpenSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // child: Center(
                  //
                  // ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Image.asset(
                    "assets/images/ic_arrow.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,
      //try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Get in Touch with ${_fullName.split(" ")[0]},",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 17, horizontal: 110),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => print("followed"),
              child: Container(
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF556DD3),
                ),
                child: Center(
                  child: Text(
                    "Cập nhật ảnh đại diện.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(width: 50.0),
          // Expanded(
          //   child: InkWell(
          //     onTap: () => print("Message"),
          //     child: Container(
          //       height: 40.0,
          //       decoration: BoxDecoration(
          //         border: Border.all(),
          //       ),
          //       child: Center(
          //         child: Padding(
          //           padding: EdgeInsets.all(10.0),
          //           child: Text(
          //             "MESSAGE",
          //             style: TextStyle(fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFF5F6FA),
        appBar: AppBar(
            title: Text("Setting"),
            centerTitle: true,
            // leading: IconButton(
            //     icon: Icon(Icons.notifications_active),
            //     onPressed: () {
            //       // Do something.
            //     })
        ),
        body: Stack(
          children: <Widget>[
            _buildCoverImage(screenSize),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    _buildProfileImage(),
                    _buildFullName(),
                    _buildButtons(),
                    _buildStatus(context),
                    _buildStatusLogin(context),
                    SizedBox(height: 60.0),
                    _buildStatContainerInfoTinh(),
                    _buildStatContainerInfoPerson(),
                    _buildStatContainerChangePass(),
                    _buildStatContainerLogout(),
                    // _buildStatContainer(),
                    // _buildBio(context),
                    // _buildSeparator(screenSize),
                    // SizedBox(height: 10.0),
                    // _buildGetInTouch(context),
                    // SizedBox(height: 8.0),

                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
