import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/login_model.dart';

import '../../ProgressHUD.dart';
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

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  "assets/images/bg_app.png",
                  fit: BoxFit.contain,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
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
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 185, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
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
                            SizedBox(width: 15),
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
                                  'login to accesss dasboard',
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
                          style:
                          TextStyle(color: borderFocusEdittextColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) => loginRequestModel.ip = input,
                          validator: (input) => !input.contains('.')
                              ? "Ip should be valid"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "IP nhà máy",
                            hintStyle: TextStyle(
                                 color: borderFocusEdittextColor),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderEdittextColor)),
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
                          style:
                          TextStyle(color: borderFocusEdittextColor),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => loginRequestModel.username = input,
                          validator: (input) => !input.contains('')
                              ? "Email Id should be valid"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "Tên đăng nhập",
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderEdittextColor)),
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
                          style:
                              TextStyle(color: borderFocusEdittextColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              loginRequestModel.password = input,
                          validator: (input) => input.length < 3
                              ? "Password should be more than 3 characters"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderEdittextColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: borderFocusEdittextColor)),
                            // prefixIcon: Icon(
                            //   Icons.lock,
                            //   color: Theme.of(context).accentColor,
                            // ),
                            // suffixIcon: IconButton(
                            //   onPressed: () {
                            //     setState(() {
                            //       hidePassword = !hidePassword;
                            //     });
                            //   },
                            //   color: Theme.of(context)
                            //       .accentColor
                            //       .withOpacity(0.4),
                            //   icon: Icon(hidePassword
                            //       ? Icons.visibility_off
                            //       : Icons.visibility),
                            // ),
                          ),
                        ),
                        SizedBox(height: 90),
                        // ignore: deprecated_member_use
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 17, horizontal: 120),
                          onPressed: () {
                            if (validateAndSave()) {
                              print(loginRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = new APIService();
                              apiService.login(loginRequestModel).then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  if (value.data.accessToken.isNotEmpty) {
                                    final snackBar = SnackBar(
                                        content: Text("Login Successful"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  } else {
                                    final snackBar =
                                        SnackBar(content: Text(value.message));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  }
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
          ],
        ),
      ),
    );
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
