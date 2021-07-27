import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:water_iot/SharedPref.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/screen/login/login.dart';
import 'package:water_iot/screen/user/change_password.dart';
import 'package:water_iot/screen/user/info_user.dart';

import '../../ProgressHUD.dart';
import '../../constants.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final String _fullName = userLocal.name;
  final String _lastLoginGin = userLocal.lastLogin;
  String urlImg;
  final String _status = "Software Developer";
  final String _bio =
      "\"Hi, I am a Freelance developer working for hourly basis. If you wants to contact me to build your product leave a message.\"";
  final String _followers = "173";
  final String _posts = "24";
  final String _scores = "450";
  File imageFile;
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.6,
    );
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
    return loadProfile();
  }

  Widget loadProfile() {
    if (userLocal.avatar.isEmpty) {
      urlImg = "assets/images/no_image.png";
      return Center(
        child: Container(
          width: 140.0,
          height: 140.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(urlImg),
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
    } else {
      urlImg = userLocal.avatar;
      return Center(
        child: Container(
          width: 140.0,
          height: 140.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new CachedNetworkImageProvider(urlImg),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(80.0),
            border: Border.all(
              color: Color(0xFF556DD3),
              width: 1.0,
            ),
          ),
          // child: CachedNetworkImage(
          //   imageUrl: urlImg,
          //   placeholder: (context, url) => new CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => new Icon(Icons.error),
          // ),
        ),
      );
    }
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
        "Lần Truy Cập Gần Nhất:",
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
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
        _lastLoginGin,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
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
                    'Thông Tin Chung',
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
    return InkWell(
      child: Container(
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
                      'Thông Tin Người Dùng',
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
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonalInfoPage()),
        );
      },
    );
  }

  Widget _buildStatContainerChangePass() {
    return InkWell(
      child: Container(
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
                      'Đổi Mật Khẩu',
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
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePasswordPage()),
        );
      },
    );
  }

  Widget _buildStatContainerLogout() {
    return InkWell(
      child: Container(
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
                      'Đăng Xuất',
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
      ),
      onTap: () {
        logOut();
      },
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
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        "Get in Touch with ${_fullName.split(" ")[0]},",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 75),
      child: Container(
        height: 30.0,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Color(0xFF556DD3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: new EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/img_camera.png',
                    height: 20.0,
                    width: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: (){
                  _getFromGallery();
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Cập Nhật Hình Ảnh Đại Diện",
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
      ),
    );
  }

  Widget _uiSetup(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Tài Khoản"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/ic_notification.svg',
                height: 20.0,
                width: 20.0,
                allowDrawingOutsideViewBox: true,
              ),
              onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
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
                    SizedBox(height: 8),
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

  logOut() {
    deleteUserInfo();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
      (route) => false,
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        isApiCallProcess = true;
      });
      // File imageFile = File(pickedFile.path);
      print(imageFile);
      APIService apiService = new APIService();
      apiService.uploadImageHTTP(imageFile).then((value) {
        setState(() {
          isApiCallProcess = false;
        });
        userLocal.avatar = value.data.avatar;
        setState(() {
          return userLocal;
        });
      });
    }
  }
}
