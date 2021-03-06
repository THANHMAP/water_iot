import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/motor.dart';
import 'package:water_iot/model/valve_model.dart';
import 'package:water_iot/screen/login/login.dart';

import '../../ProgressHUD.dart';
import '../../SharedPref.dart';
import '../../constants.dart';

class ValveDetailPage extends StatefulWidget {
  int _currentIndex;

  ValveDetailPage(this._currentIndex, {Key key}) : super(key: key);

  @override
  _ValveDetailState createState() => _ValveDetailState(_currentIndex);
}

class _ValveDetailState extends State<ValveDetailPage> {
  bool isReload = true;
  bool isApiCallProcess = false;
  int position;
  String title;
  List<DataValve> _listValves = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  _ValveDetailState(this.position);

  @override
  void initState() {
    super.initState();
    loadTitle(position);
    loadData();
  }

  loadTitle(int position) {
    switch (position) {
      case 0:
        title = "RAW STATION";
        break;
      case 1:
        title = "PROCESS STATION";
        break;
      case 2:
        title = "CHEMICAL STATION";
        break;
      case 3:
        title = "Sludge Station";
        break;
      case 4:
        title = "Supply Station";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.6,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
              title: Text(title
                  // style: TextStyle(color: mTexHeadLoginColor),
                  ),
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
              leading: IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/ic_back.svg',
                    height: 20.0,
                    width: 20.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // Do something.
                  })),
          body: Stack(
            children: <Widget>[
              _buildListView(),
            ],
          )),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: _listValves == null ? 0 : _listValves.length,
        itemBuilder: (context, index) {
          return _buildCard(_listValves[index]);
        });
  }

  Widget _buildCard(DataValve dataValve) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(children: <Widget>[
                  new Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                              bottom: BorderSide(
                                  width: 1, color: Colors.lightBlue.shade900),
                            ),
                            color: Colors.white,
                          ),
                          child: Text(
                            dataValve.name + " - " + dataValve.symbol,
                            style: TextStyle(
                              color: textDashboardColor,
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child:
                              Column(mainAxisSize: MainAxisSize.max, children: <
                                  Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 2,
                                    child: Text("Status: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                            fontSize: 18)),
                                  ),
                                  Flexible(
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Container(
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color:
                                              HexColor(dataValve.statusColor),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          // border: Border.all(
                                          //   color: Colors.red,
                                          //   width: 1,
                                          // )
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          child: Center(
                                            child: Text(dataValve.statusName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[800],
                                                    fontSize: 18)),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 2,
                                    child: Text("Operating Status: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                            fontSize: 18)),
                                  ),
                                  Flexible(
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Container(
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: HexColor(
                                              dataValve.operationStatusColor),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          // border: Border.all(
                                          //   color: Colors.red,
                                          //   width: 1,
                                          // )
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          child: Center(
                                            child: Text(
                                                dataValve.operationStatusName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[800],
                                                    fontSize: 18)),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 2,
                                    child: Text("Total LFO: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                            fontSize: 18)),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: Text(dataValve.totalfo.toString(),
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 2,
                                    child: Text("Total LFC: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                            fontSize: 18)),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: Text(dataValve.totalfc.toString(),
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 2,
                                    child: Text("Total LOC: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                            fontSize: 18)),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: Text(dataValve.totaloc.toString(),
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18)),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loadData() async {
    if (isReload == true) {
      setState(() {
        isApiCallProcess = true;
      });
    }
    APIService apiService = new APIService();
    apiService
        .getListValve(userLocal.accessToken, factoryLocal.factoryId.toString())
        .then((value) {
      if (isReload == true) {
        setState(() {
          isApiCallProcess = false;
        });
      }
      if (value.statusCode == 200) {
        DateTime now = DateTime.now();
        _listValves = value.data[position].dataValve;
        if (_listValves.length > 0) {
          print(value.toJson());
          Timer(Duration(seconds: 120), () {
            isReload = false;
            loadData();
            print("Yeah, this line is printed after 120 seconds");
          });
        } else {
          dialog();
        }
      } else {
        if (value.errorCode == 401) {
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
      }
    }).catchError((onError) {
      setState(() {
        isApiCallProcess = false;
      });
      final snackBar = SnackBar(content: Text("L???i server"));
      scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }

  dialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Kh??ng c?? d??? li???u'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
