import 'dart:convert';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/electric/bieugiadien.dart';
import 'package:water_iot/screen/login/login.dart';
import 'package:intl/intl.dart' as intl;
import '../../../ProgressHUD.dart';
import '../../../SharedPref.dart';
import '../../../constants.dart';

class BieuGiaDienPage extends StatefulWidget {
  @override
  _BieuGiaDienPageState createState() => _BieuGiaDienPageState();
}

class _BieuGiaDienPageState extends State<BieuGiaDienPage> {
  bool isApiCallProcess = false;
  List<BieuGiaDien> bieugiadien;
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
              title: Text("Tổng Điện Năng Tiêu Thụ"
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
        itemCount: bieugiadien == null ? 0 : bieugiadien.length,
        itemBuilder: (context, index) {
          return _buildItem(bieugiadien[index]);
        });
  }

  Widget _buildItem(BieuGiaDien bieuGiaDien) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ExpansionTileCard(
        baseColor: Colors.grey[200],
        expandedTextColor: Colors.black,
        // expandedColor: Colors.black,
        // key: cardA,
        // leading: CircleAvatar(
        //     child: Image.asset("assets/images/devs.jpg")),
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
                        bieuGiaDien == null ? "" : bieuGiaDien.title,
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
                for (var i = 0; i < bieuGiaDien.dataList.length; i++)
                  loadTypeInfo(bieuGiaDien.dataList[i])
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadTypeInfo(DataList dataList) {
    if (dataList.infoDienNangTieuThu != null) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: <Widget>[
          new Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    dataList.title,
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
                  child:
                      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                          bottom: BorderSide(
                              width: 1, color: Colors.lightBlue.shade900),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("1",
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 17)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("2",
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 17)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("3",
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 17)),
                        ],
                      ),
                    ),
                        Container(
                          margin: const EdgeInsets.only(top: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("4",
                                  style: TextStyle(
                                      color: Colors.grey[800], fontSize: 17)),
                            ],
                          ),
                        ),
                  ]),
                ),
                Expanded(
                  flex: 5,
                  child:
                      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                          bottom: BorderSide(
                              width: 1, color: Colors.lightBlue.shade900),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Thời điểm",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Text("Kwh",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Text("VND",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 80,
                                child: Text(dataList.infoDienNangTieuThu.trongNgay.thoiGian,
                                    style: TextStyle(
                                        color: Colors.grey[800], fontSize: 16)),
                              ),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      formatter.format(
                                          dataList.infoDienNangTieuThu.trongNgay.kwh),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      formatter.format(dataList
                                          .infoDienNangTieuThu.trongNgay.thanhTien),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 80,
                                child: Text(dataList.infoDienNangTieuThu.trongThang.thoiGian,
                                    style: TextStyle(
                                        color: Colors.grey[800], fontSize: 16)),
                              ),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      formatter.format(
                                          dataList.infoDienNangTieuThu.trongThang.kwh),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      formatter.format(dataList
                                          .infoDienNangTieuThu.trongThang.thanhTien),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 80,
                                child: Text(dataList.infoDienNangTieuThu.trongNam.thoiGian,
                                    style: TextStyle(
                                        color: Colors.grey[800], fontSize: 16)),
                              ),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      formatter.format(
                                          dataList.infoDienNangTieuThu.trongNam.kwh),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      formatter.format(dataList
                                          .infoDienNangTieuThu.trongNam.thanhTien),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 80,
                                child: Text(dataList.infoDienNangTieuThu.tong.thoiGian,
                                    style: TextStyle(
                                        color: Colors.grey[800], fontSize: 16)),
                              ),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      formatter.format(
                                          dataList.infoDienNangTieuThu.tong.kwh),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      formatter.format(dataList
                                          .infoDienNangTieuThu.tong.thanhTien),
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
      );
    } else {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: <Widget>[
          new Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    dataList.title,
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
                  child:
                      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                          bottom: BorderSide(
                              width: 1, color: Colors.lightBlue.shade900),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("1",
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 17)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("2",
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 17)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("3",
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 17)),
                        ],
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  flex: 5,
                  child:
                      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                          bottom: BorderSide(
                              width: 1, color: Colors.lightBlue.shade900),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Thời điểm",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Text("Kwh",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Text("VND",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: Text(dataList.infoBieuGiaDien.thapDiem.thoiGian,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 16)),
                          ),
                          RichText(
                            text: WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xFF555555)),
                                child: Text(
                                  formatter.format(
                                      dataList.infoBieuGiaDien.thapDiem.kwh),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          RichText(
                            text: WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xFF555555)),
                                child: Text(
                                  formatter.format(dataList
                                      .infoBieuGiaDien.thapDiem.thanhTien),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: Text(dataList.infoBieuGiaDien.binhThuong.thoiGian,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 16)),
                          ),

                          RichText(
                            text: WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xFF555555)),
                                child: Text(
                                  formatter.format(
                                      dataList.infoBieuGiaDien.binhThuong.kwh),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          RichText(
                            text: WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xFF555555)),
                                child: Text(
                                  formatter.format(dataList
                                      .infoBieuGiaDien.binhThuong.thanhTien),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: Text(dataList.infoBieuGiaDien.caoDiem.thoiGian,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 16)),
                          ),

                          RichText(
                            text: WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xFF555555)),
                                child: Text(
                                  formatter.format(
                                      dataList.infoBieuGiaDien.caoDiem.kwh),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          RichText(
                            text: WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xFF555555)),
                                child: Text(
                                  formatter.format(dataList
                                      .infoBieuGiaDien.caoDiem.thanhTien),
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
      );
    }
  }

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
        bieugiadien = value.data.bieuGiaDien;
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
