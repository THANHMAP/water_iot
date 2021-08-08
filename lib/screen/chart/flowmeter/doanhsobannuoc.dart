import 'dart:convert';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/flowmeter/doanhsobannuoc.dart';


import '../../../ProgressHUD.dart';
import '../../../SharedPref.dart';
import '../../../constants.dart';

class DoanhSoBanNuocPage extends StatefulWidget {
  @override
  _DoanhSoBanNuocPageState createState() => _DoanhSoBanNuocPageState();
}

class _DoanhSoBanNuocPageState extends State<DoanhSoBanNuocPage> {
  bool isApiCallProcess = false;
  List<DoanhSoBanNuoc> doanhsobannuoc;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // loadTitle(position);
    loadData();
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
              title: Text("Doanh Số Bán Nước"
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
        itemCount: doanhsobannuoc == null ? 0 : doanhsobannuoc.length,
        itemBuilder: (context, index) {
          return _buildItem(doanhsobannuoc[index]);
        });
  }

  Widget _buildItem(DoanhSoBanNuoc doanhSoBanNuoc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ExpansionTileCard(
        baseColor: Colors.grey[200],
        expandedTextColor: Colors.black,
        // expandedColor: Colors.black,
        // key: cardA,
        // leading: CircleAvatar(
        //     child: Image.asset("assets/images/devs.jpg")),
        title: Text(doanhSoBanNuoc.title),
        // subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
        children: <Widget>[
          Divider(
            thickness: 2.0,
            height: 2.0,
          ),
          InkWell(
            // onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var i = 0; i < doanhSoBanNuoc.dataList.length; i++)
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
                                doanhSoBanNuoc.dataList[i].title,
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
                              flex: 1,
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
                                        MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("#",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("0",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontSize: 17)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("1",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontSize: 17)),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                            Expanded(
                              flex: 5,
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
                                    Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(doanhSoBanNuoc.dataList[i].info.value.toString(),
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontSize: 17)),
                                          RichText(
                                            text: WidgetSpan(
                                              child: Container(
                                                width: 90,
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(4),
                                                    color: Color(0xFF4CAF50)),
                                                child: Text(
                                                  "value",
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
                                    Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(doanhSoBanNuoc.dataList[i].info.unit.isEmpty ? "0" : doanhSoBanNuoc.dataList[i].info.unit,
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontSize: 17)),
                                          RichText(
                                            text: WidgetSpan(
                                              child: Container(
                                                width: 90,
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(4),
                                                    color: Color(0xFF4CAF50)),
                                                child: Text(
                                                  "unit",
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
                          ],
                        ),
                      ),
                    ]),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadTable(Info info){
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(info.value.toString(),
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 17)),
          RichText(
            text: WidgetSpan(
              child: Container(
                width: 100,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(4),
                    color: Color(0xFF4CAF50)),
                child: Text(
                  "value",
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
    );
  }

  loadData() async {
    setState(() {
      isApiCallProcess = true;
    });
    APIService apiService = new APIService();
    apiService
        .getListFlowmeter(factoryLocal.factoryId.toString())
        .then((value) {
      setState(() {
        isApiCallProcess = false;
      });
      if (value.statusCode == 200) {
        // doanhsobannuoc = value.data.doanhSoBanNuoc;
        // if (_listMotors.length > 0) {
        //   print(value.toJson());
        //   Timer(Duration(seconds: 120), () {
        //     isReload = false;
        //     loadData();
        //     print("Yeah, this line is printed after 120 seconds");
        //   });
        // } else {
        //   dialog();
        // }
      }
    }).catchError((onError) {
      setState(() {
        isApiCallProcess = false;
      });
      final snackBar = SnackBar(content: Text("Lỗi server"));
      scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }
}
