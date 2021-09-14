import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/sensor_model.dart';

import '../../ProgressHUD.dart';
import '../../SharedPref.dart';
import '../../constants.dart';

class DetailSensorPage extends StatefulWidget {
  int _currentIndex;

  DetailSensorPage(this._currentIndex, {Key key}) : super(key: key);

  @override
  _DetailSensorState createState() => _DetailSensorState(_currentIndex);
}

class _DetailSensorState extends State<DetailSensorPage> {
  bool isReload = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<DataList> listDataSensor = [];
  TextEditingController _textFieldController = TextEditingController();
  int positon;
  String codeDialog;
  String valueText;
  String updateStatus;
  static const _locale = 'en';
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(double.parse(s));
  _DetailSensorState(this.positon);

  String title;

  @override
  void initState() {
    super.initState();
    loadTitle(positon);
    loadData();
  }

  loadTitle(int positon) {
    switch (positon) {
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

  Widget _buildListView() {
    return ListView.builder(
        itemCount: listDataSensor == null ? 0 : listDataSensor.length,
        itemBuilder: (context, index) {
          return _buildCard(listDataSensor[index], index);
          // return _buildRow(data[index]);
        });
  }

  // Widget _buildTable(DataList dataList) {
  //   return Center(
  //       child: Column(children: <Widget>[
  //     Container(
  //       margin: EdgeInsets.all(10),
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Color(0xFFE5E7EB)),
  //         // borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Expanded(
  //             child: Table(
  //               border: TableBorder(
  //                   horizontalInside: BorderSide(color: Color(0xFFE5E7EB)),
  //                   right: BorderSide(color: Color(0xFFE5E7EB))),
  //               children: [
  //                 TableRow(
  //                     decoration: BoxDecoration(
  //                       color: Color(0xFFF5F5F5),
  //                     ),
  //                     children: [
  //                       Container(
  //                           height: 40.0,
  //                           child: Center(
  //                               child: Text(
  //                             dataList.name + " " + dataList.symbol,
  //                             style: TextStyle(fontWeight: FontWeight.bold),
  //                           ))),
  //                     ]),
  //                 TableRow(children: [
  //                   Container(
  //                     child: Table(
  //                       border: TableBorder.symmetric(
  //                           inside:
  //                               BorderSide(width: 1, color: Color(0xFFE5E7EB))),
  //                       children: [
  //                         for (var i = 0; i < dataList.dataSensor.length; i++)
  //                           TableRow(children: [
  //                             Container(
  //                                 height: 40.0,
  //                                 child: Center(
  //                                     child: Text(
  //                                   dataList.dataSensor[i].value,
  //                                 ))),
  //                             Container(
  //                               height: 40.0,
  //                               child: Center(
  //                                 child: RichText(
  //                                   text: WidgetSpan(
  //                                     child: Container(
  //                                       padding: EdgeInsets.all(6),
  //                                       decoration: BoxDecoration(
  //                                           borderRadius:
  //                                               BorderRadius.circular(4),
  //                                           color: Color(0xFF4CAF50)),
  //                                       child: Text(
  //                                         dataList.dataSensor[i].unit,
  //                                         textAlign: TextAlign.center,
  //                                         style: TextStyle(
  //                                           //backgroundColor: Colors.blueAccent,
  //                                           fontWeight: FontWeight.w500,
  //                                           color: Colors.white,
  //
  //                                           //backgroundColor: Colors.blue
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ]),
  //                       ],
  //                     ),
  //                   ),
  //                 ]),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ]));
  // }

  Widget _buildCard(DataList dataList, int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          // onTap: () {},
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
                          child: Text(
                            dataList.name + " " + dataList.symbol,
                            style: TextStyle(
                              color: textDashboardColor,
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // child: Center(
                          //
                          // ),
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
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Colors.lightBlue.shade900),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Value",
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      Text("Unit",
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ),
                                if (dataList.dataSensor.length > 0)
                                  for (var i = 0;
                                      i < dataList.dataSensor.length;
                                      i++)
                                    Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(_formatNumber(dataList.dataSensor[i].value.replaceAll(',', '')),
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontSize: 17)),
                                          RichText(
                                            text: WidgetSpan(
                                              child: Container(
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Color(0xFF4CAF50)),
                                                child: Text(
                                                  dataList.dataSensor[i].unit,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Colors.lightBlue.shade900),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text("Set Point",
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                getContainer(
                                    dataList.editSetPoint,
                                    dataList.idSetPoint,
                                    dataList.fieldSetPoint,
                                    dataList.setPoint,
                                    index)
                              ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  new Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            "Cập nhật: " + dataList.updateStatus,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontFamily: 'OpenSans',
                              fontSize: 15.0,
                            ),
                          ),
                          // child: Center(
                          //
                          // ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),

              // Row(

              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _uiSetup(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          key: _scaffoldKey,
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

  loadData() async {
    if (isReload == true) {
      setState(() {
        isApiCallProcess = true;
      });
    }
    APIService apiService = new APIService();
    apiService
        .getListSensor(userLocal.accessToken, factoryLocal.factoryId.toString())
        .then((value) {
      if (isReload == true) {
        setState(() {
          isApiCallProcess = false;
        });
      }
      if (value.statusCode == 200) {
        updateStatus = DateFormat('dd-MM-yyyy kk:mm:ss').format(DateTime.now());
        listDataSensor = value.data[positon].dataList;
        if (listDataSensor.length > 0) {
          for (var i = 0; i < listDataSensor.length; i++) {
            listDataSensor[i].updateStatus = updateStatus;
          }
          // setState(() {
          //   listDataSensor;
          // });
          print(value.toJson());
          Timer(Duration(seconds: 30), () {
            isReload = false;
            loadData();
            print("Yeah, this line is printed after 120 seconds");
          });
        } else {
          dialog();
        }
      }
    }).catchError((onError) {
      print(onError);
      setState(() {
        isApiCallProcess = false;
      });
      showInSnackBar("Lỗi server");
    });
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }

  Container getContainer(
      String value, String idSetpoint, String field, String text, int index) {
    if (value == "true") {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: InkWell(
                onTap: () {
                  _displayTextInputDialog(
                      context, idSetpoint, field, text, index);
                },
                child: RichText(
                  text: WidgetSpan(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFF007BFF)),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("No Update",
                style: TextStyle(color: Colors.grey[800], fontSize: 17)),
          ],
        ),
      );
    }
  }

  Future<void> _displayTextInputDialog(BuildContext context, String idSetpoint,
      String field, String valueSensor, int index) async {
    _textFieldController.text = valueSensor;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update SetPoint'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Input Value Sensor"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    updateSensor(idSetpoint, field, valueText, index);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  updateSensor(
      String idSetpoint, String field, String valuePoint, int index) async {
    setState(() {
      isApiCallProcess = true;
    });
    APIService apiService = new APIService();
    apiService
        .updateSetpoint(userLocal.accessToken, idSetpoint, field, valuePoint)
        .then((value) {
      if (value.statusCode == 200) {
        print(value.toJson());
        listDataSensor[index].setPoint = valuePoint;
      }
      setState(() {
        isApiCallProcess = false;
      });
    });
  }

  dialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Không có dữ liệu'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
