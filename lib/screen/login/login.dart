import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/login_model.dart';
import 'package:water_iot/screen/factory/factory.dart';
import 'package:water_iot/screen/factory/factory_admin.dart';
import 'package:water_iot/screen/main/main.dart';

import '../../ProgressHUD.dart';
import '../../SharedPref.dart';
import '../../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode _focusIpNode, _focusUserNode, _focusPasswordNode;

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
    _focusIpNode = new FocusNode();
    _focusUserNode = new FocusNode();
    _focusPasswordNode = new FocusNode();
    deleteUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/bg_app.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                child: SingleChildScrollView(
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.2),
                                  offset: Offset(0, 10),
                                  blurRadius: 20)
                            ],
                          ),
                          child: Form(
                            key: globalFormKey,
                            child: Column(
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    SizedBox(width: 5),
                                    Image.asset(
                                      "assets/images/logo.png",
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          'Login To Accesss Dasboard',
                                          style: TextStyle(
                                            color: mTexHeadLoginColor,
                                            fontFamily: 'OpenSans',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                new TextFormField(
                                  onTap: _requestIpFocus,
                                  focusNode: _focusIpNode,
                                  initialValue: "197.168.0.12",
                                  style: TextStyle(
                                      color: borderFocusEdittextColor),
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) =>
                                      loginRequestModel.ip = input,
                                  validator: (input) => !input.contains('.')
                                      ? "Ip should be valid"
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "IP nhà máy",
                                    hintStyle: TextStyle(
                                        color: _focusIpNode.hasFocus
                                            ? borderFocusEdittextColor
                                            : borderEdittextColor),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: borderEdittextColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: borderFocusEdittextColor)),
                                    // prefixIcon: Icon(
                                    //   Icons.email,
                                    //   color: Theme.of(context).accentColor,
                                    // ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                new TextFormField(
                                  onTap: _requestUserFocus,
                                  focusNode: _focusUserNode,
                                  initialValue: "phucthinh@gmail.com",
                                  style: TextStyle(
                                      color: borderFocusEdittextColor),
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (input) =>
                                      loginRequestModel.username = input,
                                  validator: (input) => !input.contains('')
                                      ? "Email Id should be valid"
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "Tên đăng nhập",
                                    hintStyle: TextStyle(
                                        color: _focusUserNode.hasFocus
                                            ? borderFocusEdittextColor
                                            : borderEdittextColor),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: borderEdittextColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: borderFocusEdittextColor)),
                                  ),
                                ),
                                SizedBox(height: 20),
                                new TextFormField(
                                  onTap: _requestPasswordFocus,
                                  focusNode: _focusPasswordNode,
                                  initialValue: "123456789",
                                  style: TextStyle(
                                      color: borderFocusEdittextColor),
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) =>
                                      loginRequestModel.password = input,
                                  validator: (input) => input.length < 3
                                      ? "Password should be more than 3 characters"
                                      : null,
                                  obscureText: hidePassword,
                                  decoration: new InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: _focusPasswordNode.hasFocus
                                            ? borderFocusEdittextColor
                                            : borderEdittextColor),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: borderEdittextColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: borderFocusEdittextColor)),
                                  ),
                                ),
                                SizedBox(height: 40),
                                // ignore: deprecated_member_use
                                Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: borderEdittextColor,
                                    fontFamily: 'OpenSans',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 50),
                                FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 17, horizontal: 110),
                                  onPressed: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    if (validateAndSave()) {
                                      print(loginRequestModel.toJson());

                                      setState(() {
                                        isApiCallProcess = true;
                                      });

                                      APIService apiService = new APIService();
                                      apiService
                                          .login(loginRequestModel)
                                          .then((value) {
                                        if (value != null) {
                                          setState(() {
                                            isApiCallProcess = false;
                                          });

                                          if (value.statusCode == 200) {
                                            saveUserInfo(value.data);
                                            if (value.data.accessToken != null) {
                                              var screen ;
                                              Group group = value.data.group.first;
                                              if(group.code == "super_admin_app"){
                                                screen = FactoryAminPage();
                                              }else if(group.code == "admin"){
                                                screen = MainPage(1);
                                              }else if(group.code == "viewer"){
                                                screen = MainPage(1);
                                              }
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return screen;
                                                  },
                                                ),
                                                (route) => false,
                                              );
                                              final snackBar = SnackBar(
                                                  content: Text("Login Successful"));
                                              scaffoldKey.currentState
                                                  .showSnackBar(snackBar);
                                            }
                                          } else {
                                            final snackBar = SnackBar(
                                                content: Text(value.message));
                                            scaffoldKey.currentState
                                                .showSnackBar(snackBar);
                                          }
                                        } else {
                                          setState(() {
                                            isApiCallProcess = false;
                                          });
                                        }
                                      });
                                    }
                                  },
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: loginButtonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // children: <Widget>[
              //   // new Container(
              //   //   decoration: new BoxDecoration(
              //   //     image: new DecorationImage(
              //   //       image: new AssetImage("assets/images/bg_app.png"),
              //   //       fit: BoxFit.cover,
              //   //     ),
              //   //   ),
              //   // ),
              //
              // ],
            ))
    );
  }

  void _requestIpFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusIpNode);
    });
  }

  void _requestUserFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusUserNode);
    });
  }

  void _requestPasswordFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusPasswordNode);
    });
  }



  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusIpNode.dispose();
    _focusUserNode.dispose();
    _focusPasswordNode.dispose();

    super.dispose();
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
