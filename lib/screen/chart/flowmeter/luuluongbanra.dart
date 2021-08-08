import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/flowmeter/flowmeter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:water_iot/screen/login/login.dart';

import '../../../ProgressHUD.dart';
import '../../../SharedPref.dart';
import '../../../constants.dart';

class LuuLuongBanRaPage extends StatefulWidget {
  @override
  _LuuLuongBanRaPageState createState() => _LuuLuongBanRaPageState();
}

class _LuuLuongBanRaPageState extends State<LuuLuongBanRaPage> {
  bool isApiCallProcess = false;
  List<LuuLuongData> luuLuongDauVao;
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
              title: Text("Lưu Lượng Bán Ra"
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
        itemCount: luuLuongDauVao == null
            ? 0
            : luuLuongDauVao[0].dataList.length,
        itemBuilder: (context, index) {
          return _buildItem(luuLuongDauVao[0].dataList[index]);
        });
  }

  Widget _buildItem(DataList dataList) {
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
                                              color: Colors.grey[800],
                                              fontSize: 17)),
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
                                for (var i = 0; i < dataList.info.length; i++)
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(formatter.format(dataList.info[i].value),
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
                                                  color: Color(0xFF555555)),
                                              child: Text(
                                                dataList.info[i].unit,
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
        luuLuongDauVao = value.data.luuLuongBanRa;
      }else {
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
