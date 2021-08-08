import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/screen/chart/hoachat/clo.dart';
import 'package:water_iot/screen/chart/hoachat/orther.dart';
import 'package:water_iot/screen/chart/hoachat/pac.dart';
import 'package:water_iot/screen/chart/hoachat/polyme.dart';
import 'package:water_iot/screen/chart/hoachat/voi.dart';
import 'package:water_iot/screen/device/MotorDetail.dart';

import '../../../SharedPref.dart';
import '../../../constants.dart';



class HoaChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HoaChatPageState();
}

class _HoaChatPageState extends State {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
          title: Text(
            "Hóa Chất",
            // style: TextStyle(color: mTexHeadLoginColor),
          ),
          centerTitle: true,
          // actions: <Widget>[
          //   IconButton(
          //     icon: SvgPicture.asset(
          //       'assets/images/ic_notification.svg',
          //       height: 20.0,
          //       width: 20.0,
          //       allowDrawingOutsideViewBox: true,
          //     ),
          //     onPressed: () {
          //       // ScaffoldMessenger.of(context).showSnackBar(
          //       //     const SnackBar(content: Text('This is a snackbar')));
          //     },
          //   ),
          // ],
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
                          child: Text(
                            factoryLocal.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: borderEdittextColor,
                              fontFamily: 'OpenSans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Column(children: <Widget>[
                            _buildVoi(),
                            _buildPac(),
                            _buildPolyme(),
                            _buildClo(),
                            _buildKhac(),
                          ]),
                        )
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

  Widget _buildVoi() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VoiPage(),
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                color: HexColor("#4caf50"),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     // color: Colors.amber,
                        //     // height: 100,
                        //     child: Align(
                        //       alignment: Alignment.topRight,
                        //       child: SvgPicture.asset(
                        //         "assets/images/ic_pump.svg",
                        //         color: Color(0xFFF4F5F8),
                        //         height: 70,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Text(
                                        "Vôi",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // new Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         margin: const EdgeInsets.only(top: 10.0),
                              //         alignment: Alignment.center,
                              //         // color: Colors.amber,
                              //         child: Image.asset(
                              //           "assets/images/ic_arrow_down.png",
                              //           height: 10,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Row(

              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPac() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PACPage(),
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                color: HexColor("#afb42b"),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     // color: Colors.amber,
                        //     // height: 100,
                        //     child: Align(
                        //       alignment: Alignment.topRight,
                        //       child: SvgPicture.asset(
                        //         "assets/images/ic_pump.svg",
                        //         color: Color(0xFFF4F5F8),
                        //         height: 70,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Text(
                                        "PAC",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // new Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         margin: const EdgeInsets.only(top: 10.0),
                              //         alignment: Alignment.center,
                              //         // color: Colors.amber,
                              //         child: Image.asset(
                              //           "assets/images/ic_arrow_down.png",
                              //           height: 10,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Row(

              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPolyme() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PolymePage(),
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                color: HexColor("#ffab00"),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     // color: Colors.amber,
                        //     // height: 100,
                        //     child: Align(
                        //       alignment: Alignment.topRight,
                        //       child: SvgPicture.asset(
                        //         "assets/images/ic_pump.svg",
                        //         color: Color(0xFFF4F5F8),
                        //         height: 70,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Text(
                                        "Polyme",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // new Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         margin: const EdgeInsets.only(top: 10.0),
                              //         alignment: Alignment.center,
                              //         // color: Colors.amber,
                              //         child: Image.asset(
                              //           "assets/images/ic_arrow_down.png",
                              //           height: 10,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Row(

              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClo() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CloPage(),
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                color: HexColor("#b39ddb"),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     // color: Colors.amber,
                        //     // height: 100,
                        //     child: Align(
                        //       alignment: Alignment.topRight,
                        //       child: SvgPicture.asset(
                        //         "assets/images/ic_pump.svg",
                        //         color: Color(0xFFF4F5F8),
                        //         height: 70,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Text(
                                        "Clo",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // new Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         margin: const EdgeInsets.only(top: 10.0),
                              //         alignment: Alignment.center,
                              //         // color: Colors.amber,
                              //         child: Image.asset(
                              //           "assets/images/ic_arrow_down.png",
                              //           height: 10,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Row(

              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKhac() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtherPage(),
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                color: HexColor("#00bfa5"),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     // color: Colors.amber,
                        //     // height: 100,
                        //     child: Align(
                        //       alignment: Alignment.topRight,
                        //       child: SvgPicture.asset(
                        //         "assets/images/ic_pump.svg",
                        //         color: Color(0xFFF4F5F8),
                        //         height: 70,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Text(
                                        "Khác",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // new Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         margin: const EdgeInsets.only(top: 10.0),
                              //         alignment: Alignment.center,
                              //         // color: Colors.amber,
                              //         child: Image.asset(
                              //           "assets/images/ic_arrow_down.png",
                              //           height: 10,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Row(

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
