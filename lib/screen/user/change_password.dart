import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/model/change_password_model.dart';

import '../../ProgressHUD.dart';
import '../../constants.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  FocusNode _focusPassword, _focusPasswordRetype;
  ChangePasswordRequestModel _changePasswordRequestModel;
  final TextEditingController _controllerPassword = new TextEditingController();
  final TextEditingController _controllerConfigPassword = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _changePasswordRequestModel = new ChangePasswordRequestModel();
    _focusPassword = new FocusNode();
    _focusPasswordRetype = new FocusNode();
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
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
          title: Text(
            "Change Password",
            style: TextStyle(color: mTexHeadLoginColor),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: SvgPicture.asset(
                'assets/images/ic_back.svg',
                height: 20.0,
                width: 20.0,
                allowDrawingOutsideViewBox: true,
              ),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Container(
        child: Container(
          child: SingleChildScrollView(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Form(
                            key: globalFormKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30),
                                new TextFormField(
                                  controller: _controllerPassword,
                                  onTap: _requestPasswordFocus,
                                  focusNode: _focusPassword,
                                  style: TextStyle(
                                      color: borderFocusEdittextColor),
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) =>
                                  _changePasswordRequestModel.newPassword = input,
                                  validator: (input) => input.isEmpty
                                      ? "Mật khẩu không được để trống"
                                      : null,
                                  obscureText: true,
                                  decoration: new InputDecoration(
                                    hintText: "Mật khảu mới",
                                    hintStyle:
                                        TextStyle(
                                            color: _focusPassword.hasFocus
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
                                  controller: _controllerConfigPassword,
                                  onTap: _requestPasswordRetypeFocus,
                                  focusNode: _focusPasswordRetype,
                                  style: TextStyle(
                                      color: borderFocusEdittextColor),
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) =>
                                  _changePasswordRequestModel.confirmPassword = input,
                                  validator: (input) => input.isEmpty
                                      ? "Mật khẩu không được để trống"
                                      : null,
                                  obscureText: true,
                                  decoration: new InputDecoration(
                                    hintText: "Nhập lại mật khẩu",
                                    hintStyle:
                                        TextStyle(
                                            color: _focusPasswordRetype.hasFocus
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
                                SizedBox(height: 30),
                                new Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FlatButton(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 17, horizontal: 0),
                                            onPressed: () {
                                              if(_changePasswordRequestModel.newPassword != _changePasswordRequestModel.confirmPassword){

                                              }else{
                                                showDialog<String>(
                                                  context: context,
                                                    builder: (BuildContext context) => AlertDialog(
                                                      title: const Text('AlertDialog Title'),
                                                      content: const Text('AlertDialog description'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                                          child: const Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () => Navigator.pop(context, 'OK'),
                                                          child: const Text('OK'),
                                                        ),
                                                      ],
                                                    ),
                                                );
                                              }
                                            },
                                            child: Text(
                                              "Cập nhật",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: loginButtonColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FlatButton(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 17, horizontal: 0),
                                            onPressed: () {
                                              _controllerPassword.clear();
                                              _controllerConfigPassword.clear();
                                            },
                                            child: Text(
                                              "Xóa",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: loginButtonColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _requestPasswordFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusPassword);
    });
  }

  void _requestPasswordRetypeFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusPasswordRetype);
    });
  }
}
