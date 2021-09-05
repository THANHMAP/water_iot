import 'dart:convert';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/electric/thongsodien.dart';
import 'package:water_iot/screen/login/login.dart';
import 'package:intl/intl.dart' as intl;
import '../../../ProgressHUD.dart';
import '../../../SharedPref.dart';
import '../../../constants.dart';

class DetailDienNangPage extends StatefulWidget {
  @override
  _DetailDienNangState createState() => _DetailDienNangState();
}

class _DetailDienNangState extends State<DetailDienNangPage> {
  bool isApiCallProcess = false;
  List<ThongSoDien> thongSoDien;
  static const _locale = 'en';
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(double.parse(s));
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formatter = intl.NumberFormat.decimalPattern();
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
              title: Text("Thông Số Điện"
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
        itemCount: thongSoDien == null ? 0 : thongSoDien.length,
        itemBuilder: (context, index) {
          return _buildItem(thongSoDien[index]);
        });
  }

  Widget _buildItem(ThongSoDien thongSoDien) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ExpansionTileCard(
        baseColor: Colors.grey[200],
        expandedTextColor: Colors.black,
        // expandedColor: Colors.black,
        // key: cardA,
        // leading: CircleAvatar(
        //     child: Image.asset("assets/images/devs.jpg")),
        // title: Container(
        //   child: Column(
        //     children: <Widget>[
        //       Row(
        //         children: <Widget>[
        //           new Column(
        //             children: <Widget>[
        //               Image.asset(
        //                 "assets/images/img_data.png",
        //                 fit: BoxFit.contain,
        //                 height: 35,
        //               ),
        //             ],
        //           ),
        //           Expanded(
        //               child: new Column(
        //             children: <Widget>[
        //               new Text(thongSoDien.title),
        //             ],
        //           ))
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        title: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/img_data.png",
                        fit: BoxFit.contain,
                        height: 35,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: new Text(
                        thongSoDien == null ? "" : thongSoDien.title,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
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
                              thongSoDien.dataList[0].title,
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
                                        Text("1",
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
                                        Text("2",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("3",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("4",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("5",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("6",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("7",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("8",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("9",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("10",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("11",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("12",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("13",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("14",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("15",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("16",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 19.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("17",
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
                                          MainAxisAlignment.spaceAround,
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
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.v1V2.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "v1-v2",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.v1N.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "v1-n",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.v2V3.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "v2-v3",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.v2N.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "v2-n",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.v3V1.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "v3-v1",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.v3N.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "v3-n",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.vN.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "v-n",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.a1.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "a1",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.a2.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "a2",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.a3.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "a3",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.an.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "an",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.hz.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "hz",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.cosp.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "cosp",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.kwh.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kwh",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.kvarh.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kvarh",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.kvah.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kvah",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[0].info.thd.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 60,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "thd",
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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              thongSoDien.dataList[1].title,
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
                                  Container(
                                    margin: const EdgeInsets.only(top: 18.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("2",
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
                                        Text("3",
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
                                        Text("4",
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
                                        Text("5",
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
                                        Text("6",
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
                                        Text("7",
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
                                          MainAxisAlignment.spaceAround,
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
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[1].info.kwhDay.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 100,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kwh-day",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[1].info.kvarhDay.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 100,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kvarh-day",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[1].info.kwhMonth.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 100,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kwh-month",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[1].info.kvarhMonth.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 100,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kvarh-month",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[1].info.kwhYear.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 100,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kwh-year",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[1].info.kvarhYear.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 100,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kvarh-year",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[1].info.kwhTotal.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 100,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kwh-total",
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
                                        ),


                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: new EdgeInsets.only(left: 50),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(_formatNumber(thongSoDien.dataList[1].info.kvarhTotal.replaceAll(',', '')),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 100,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      "kvarh-total",
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

                // Row(

                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildCard(ThongSoDien thongSoDien) {
  //   return Padding(
  //     padding: const EdgeInsets.all(15.0),
  //     child: Card(
  //       clipBehavior: Clip.antiAlias,
  //       elevation: 16,
  //       shape:
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //       child: InkWell(
  //         // onTap: () {},
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Container(
  //               width: double.infinity,
  //               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
  //               margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  //               child: Column(children: <Widget>[
  //                 new Row(
  //                   children: [
  //                     Expanded(
  //                       child: Container(
  //                         child: Text(
  //                           thongSoDien.title,
  //                           style: TextStyle(
  //                             color: textDashboardColor,
  //                             fontFamily: 'OpenSans',
  //                             fontSize: 20.0,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         // child: Center(
  //                         //
  //                         // ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 20),
  //                 Container(
  //                   child: Row(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Expanded(
  //                         child: Column(
  //                             mainAxisSize: MainAxisSize.max,
  //                             children: <Widget>[
  //                               Container(
  //                                 decoration: BoxDecoration(
  //                                   border: Border(
  //                                     // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
  //                                     bottom: BorderSide(
  //                                         width: 1,
  //                                         color: Colors.lightBlue.shade900),
  //                                   ),
  //                                   color: Colors.white,
  //                                 ),
  //                                 child: Row(
  //                                   mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                                   children: <Widget>[
  //                                     Text("Value",
  //                                         style: TextStyle(
  //                                             color: Colors.grey[800],
  //                                             fontWeight: FontWeight.bold,
  //                                             fontSize: 18)),
  //                                     Text("Unit",
  //                                         style: TextStyle(
  //                                             color: Colors.grey[800],
  //                                             fontWeight: FontWeight.bold,
  //                                             fontSize: 18)),
  //                                   ],
  //                                 ),
  //                               ),
  //                               if (dataList.dataSensor.length > 0)
  //                                 for (var i = 0;
  //                                 i < dataList.dataSensor.length;
  //                                 i++)
  //                                   Container(
  //                                     margin: const EdgeInsets.only(top: 10.0),
  //                                     child: Row(
  //                                       mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                       children: <Widget>[
  //                                         Text(dataList.dataSensor[i].value,
  //                                             style: TextStyle(
  //                                                 color: Colors.grey[800],
  //                                                 fontSize: 17)),
  //                                         RichText(
  //                                           text: WidgetSpan(
  //                                             child: Container(
  //                                               padding: EdgeInsets.all(6),
  //                                               decoration: BoxDecoration(
  //                                                   borderRadius:
  //                                                   BorderRadius.circular(
  //                                                       4),
  //                                                   color: Color(0xFF555555)),
  //                                               child: Text(
  //                                                 dataList.dataSensor[i].unit,
  //                                                 textAlign: TextAlign.center,
  //                                                 style: TextStyle(
  //                                                   fontWeight: FontWeight.w500,
  //                                                   color: Colors.white,
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ),
  //                             ]),
  //                       ),
  //                       Expanded(
  //                         child: Column(
  //                             mainAxisSize: MainAxisSize.max,
  //                             children: <Widget>[
  //                               Container(
  //                                 decoration: BoxDecoration(
  //                                   border: Border(
  //                                     // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
  //                                     bottom: BorderSide(
  //                                         width: 1,
  //                                         color: Colors.lightBlue.shade900),
  //                                   ),
  //                                   color: Colors.white,
  //                                 ),
  //                                 child: Row(
  //                                   mainAxisAlignment: MainAxisAlignment.end,
  //                                   children: <Widget>[
  //                                     Text("Set Point",
  //                                         style: TextStyle(
  //                                             color: Colors.grey[800],
  //                                             fontWeight: FontWeight.bold,
  //                                             fontSize: 18)),
  //                                   ],
  //                                 ),
  //                               ),
  //                               SizedBox(height: 10),
  //                               getContainer(
  //                                   dataList.editSetPoint,
  //                                   dataList.idSetPoint,
  //                                   dataList.fieldSetPoint,
  //                                   dataList.setPoint,
  //                                   index)
  //                             ]),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(height: 20),
  //                 new Row(
  //                   children: [
  //                     Expanded(
  //                       child: Container(
  //                         child: Text(
  //                           "Cập nhật: " + dataList.updateStatus,
  //                           style: TextStyle(
  //                             color: Colors.grey[800],
  //                             fontFamily: 'OpenSans',
  //                             fontSize: 15.0,
  //                           ),
  //                         ),
  //                         // child: Center(
  //                         //
  //                         // ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ]),
  //             ),
  //
  //             // Row(
  //
  //             // ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  loadData() async {
    setState(() {
      isApiCallProcess = true;
    });
    APIService apiService = new APIService();
    apiService
        .getListElectrical(factoryLocal.factoryId.toString())
        .then((value) {
      setState(() {
        isApiCallProcess = false;
      });
      if (value.statusCode == 200) {
        thongSoDien = value.data.thongSoDien;
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
      final snackBar = SnackBar(content: Text("Lỗi server"));
      scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }
}
