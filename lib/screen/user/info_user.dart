import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:water_iot/SharedPref.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/login_model.dart';

import '../../ProgressHUD.dart';
import '../../constants.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfoPage> {
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  UpdateInfoRequestModel _infoRequestModel;
  FocusNode _focusName, _focusMail, _focusBirthday, _focusPhone, _focusAddress;
  final TextEditingController _controllerName = new TextEditingController();
  final TextEditingController _controllerMail = new TextEditingController();
  final TextEditingController _controllerBirthday = new TextEditingController();
  final TextEditingController _controllerPhone = new TextEditingController();
  final TextEditingController _controllerAddress = new TextEditingController();
  String gender;

  @override
  void initState() {
    super.initState();
    if (userLocal.gender == null) {
      gender = "Nam";
    }

    _infoRequestModel = new UpdateInfoRequestModel();
    _controllerName.text = userLocal.name;
    _controllerMail.text = userLocal.email;
    // _controllerBirthday.text = userLocal.birthday;
    _controllerPhone.text = userLocal.phone;
    _controllerAddress.text = userLocal.address;
    _focusName = new FocusNode();
    _focusMail = new FocusNode();
    _focusBirthday = new FocusNode();
    _focusPhone = new FocusNode();
    _focusAddress = new FocusNode();
    setState(() {
      _infoRequestModel.birthday = "15-01-1991";
      _infoRequestModel.gender = gender;
    });
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
            "Update personal info",
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
                                  controller: _controllerName,
                                  initialValue: userLocal.name != null
                                      ? null
                                      : "",
                                  onTap: _requestNameFocus,
                                  focusNode: _focusName,
                                  style: TextStyle(
                                      color: borderFocusEdittextColor),
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) =>
                                  _infoRequestModel.name = input,
                                  validator: (input) =>
                                  input.isEmpty
                                      ? "Vui lòng nhập họ và tên"
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "Họ & tên",
                                    hintStyle: TextStyle(
                                        color: _focusName.hasFocus
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
                                  controller: _controllerPhone,
                                  onTap: _requestPhoneFocus,
                                  focusNode: _focusPhone,
                                  style: TextStyle(
                                      color: borderFocusEdittextColor),
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) =>
                                  _infoRequestModel.phone = input,
                                  validator: (input) =>
                                  input.isEmpty
                                      ? "Vui lòng nhập số điện thoại"
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "Số điện thoại",
                                    hintStyle: TextStyle(
                                        color: _focusPhone.hasFocus
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
                                  controller: _controllerMail,
                                  onTap: _requestEmailFocus,
                                  focusNode: _focusMail,
                                  style: TextStyle(
                                      color: borderFocusEdittextColor),
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) =>
                                  _infoRequestModel.email = input,
                                  validator: (input) =>
                                  input.isEmpty
                                      ? "Vui lòng nhập email"
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "E-mail",
                                    hintStyle: TextStyle(
                                        color: _focusMail.hasFocus
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
                                  controller: _controllerAddress,
                                  onTap: _requestAddressFocus,
                                  focusNode: _focusAddress,
                                  style: TextStyle(
                                      color: borderFocusEdittextColor),
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) =>
                                  _infoRequestModel.address = input,
                                  validator: (input) =>
                                  input.isEmpty
                                      ? "Vui lòng nhập địa chỉ"
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "Địa chỉ",
                                    hintStyle: TextStyle(
                                        color: _focusAddress.hasFocus
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
                                new RadioButtonGroup(
                                  labels: <String>[
                                    "Nam",
                                    "Nữ",
                                  ],
                                  // onChange: (value) => setState(() {
                                  //   _verticalGroupValue = value;
                                  // }),
                                  picked: gender,
                                  onChange: (String label, int index) =>
                                      print("label: $label index: $index"),
                                  onSelected: (String selected) {
                                    setState(() {
                                      gender = selected;
                                      _infoRequestModel.gender = selected;
                                    });
                                    print(selected);

                                  }),
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
                                              if (validateAndSave()) {
                                                setState(() {
                                                  isApiCallProcess = true;
                                                });
                                                APIService apiService =
                                                new APIService();
                                                apiService
                                                    .updatePersonalInfo(
                                                    userLocal.accessToken,
                                                    _infoRequestModel)
                                                    .then((value) {
                                                  setState(() {
                                                    isApiCallProcess = false;
                                                  });
                                                  if (value.statusCode == 200) {
                                                    Data temp = value.data;
                                                    temp.accessToken =
                                                        userLocal.accessToken;
                                                    saveUserInfo(temp);
                                                    getUserInfo();
                                                  } else {
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                      context) =>
                                                          AlertDialog(
                                                            title:
                                                            const Text('Lỗi'),
                                                            content: const Text(
                                                                'Cập nhật thông tin không thành công'),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context, 'OK');
                                                                },
                                                                child: const Text(
                                                                    'OK'),
                                                              ),
                                                            ],
                                                          ),
                                                    );
                                                  }
                                                });
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
                                              _controllerName.clear();
                                              _controllerAddress.clear();
                                              _controllerMail.clear();
                                              _controllerPhone.clear();
                                              _controllerBirthday.clear();
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

  void _requestNameFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusName);
    });
  }

  void _requestPhoneFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusPhone);
    });
  }

  void _requestEmailFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusMail);
    });
  }

  void _requestAddressFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusAddress);
    });
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
