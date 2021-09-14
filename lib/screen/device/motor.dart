import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/SharedPref.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/motor.dart';
import 'package:water_iot/screen/device/MotorDetail.dart';

import '../../ProgressHUD.dart';
import '../../constants.dart';

class MotorPage extends StatefulWidget {
  @override
  _MotorState createState() => _MotorState();
}

class _MotorState extends State<MotorPage> {
  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Data> listData = [];

  @override
  void initState() {
    super.initState();
    // loadData();
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
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
          title: Text(
            "Motor",
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
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_app.png"),
                fit: BoxFit.cover)),
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
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'MONITORING & SCALLING VALVE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF0000),
                            fontFamily: 'OpenSans',
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(children: <Widget>[
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).hintColor.withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: SvgPicture.asset(
                                          "assets/images/ic_pump.svg",
                                          color: Color(0xFF556DD3),
                                          fit: BoxFit.contain,
                                          height: 40,
                                        ),
                                        // child: Image.asset(
                                        //   "assets/images/ic_factory.png",
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                      Expanded(
                                        flex: 55,
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              "RAW STATION",
                                              style: TextStyle(
                                                color: textDashboardColor,
                                                fontFamily: 'OpenSans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          // child: Center(
                                          //
                                          // ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Image.asset(
                                          "assets/images/ic_arrow.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MotorDetailPage(0),
                                  ));
                            },
                          ),
                          SizedBox(height: 13),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).hintColor.withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: SvgPicture.asset(
                                          "assets/images/ic_process.svg",
                                          color: Color(0xFF556DD3),
                                          fit: BoxFit.contain,
                                          height: 40,
                                        ),
                                        // child: Image.asset(
                                        //   "assets/images/ic_factory.png",
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                      Expanded(
                                        flex: 55,
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              'PROCESS STATION',
                                              style: TextStyle(
                                                color: textDashboardColor,
                                                fontFamily: 'OpenSans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          // child: Center(
                                          //
                                          // ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Image.asset(
                                          "assets/images/ic_arrow.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MotorDetailPage(1)),
                              );
                            },
                          ),
                          SizedBox(height: 13),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).hintColor.withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset(
                                            "assets/images/ic_chemical.svg",
                                            color: Color(0xFF556DD3),
                                            fit: BoxFit.contain,
                                            height: 40,
                                          ),
                                        ),

                                        // child: Image.asset(
                                        //   "assets/images/ic_factory.png",
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                      Expanded(
                                        flex: 55,
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              'CHEMICAL STATION',
                                              style: TextStyle(
                                                color: textDashboardColor,
                                                fontFamily: 'OpenSans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          // child: Center(
                                          //
                                          // ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Image.asset(
                                          "assets/images/ic_arrow.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MotorDetailPage(2)),
                              );
                            },
                          ),
                          SizedBox(height: 13),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).hintColor.withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset(
                                            "assets/images/ic_chemical.svg",
                                            color: Color(0xFF556DD3),
                                            fit: BoxFit.contain,
                                            height: 40,
                                          ),
                                        ),

                                        // child: Image.asset(
                                        //   "assets/images/ic_factory.png",
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                      Expanded(
                                        flex: 55,
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              'SLUDGE STATION',
                                              style: TextStyle(
                                                color: textDashboardColor,
                                                fontFamily: 'OpenSans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          // child: Center(
                                          //
                                          // ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Image.asset(
                                          "assets/images/ic_arrow.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MotorDetailPage(3)),
                              );
                            },
                          ),
                          SizedBox(height: 13),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).hintColor.withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset(
                                            "assets/images/ic_supply.svg",
                                            color: Color(0xFF556DD3),
                                            fit: BoxFit.contain,
                                            height: 40,
                                          ),
                                        ),

                                        // child: Image.asset(
                                        //   "assets/images/ic_factory.png",
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                      Expanded(
                                        flex: 55,
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              'SUPPLY STATION',
                                              style: TextStyle(
                                                color: textDashboardColor,
                                                fontFamily: 'OpenSans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          // child: Center(
                                          //
                                          // ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Image.asset(
                                          "assets/images/ic_arrow.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MotorDetailPage(4)),
                              );
                            },
                          ),
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
    );
  }

  Widget _buildCardPUMP() {
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
                  builder: (context) => MotorDetailPage(0),
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                color: Color(0xFF556DD3),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            // height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                "assets/images/ic_pump.svg",
                                color: Color(0xFFF4F5F8),
                                height: 70,
                              ),
                            ),
                          ),
                        ),
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
                                        "RAW STATION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Image.asset(
                                        "assets/images/ic_arrow_down.png",
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

  Widget _buildCardProcess() {
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
              MaterialPageRoute(builder: (context) => MotorDetailPage(1)),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                color: Color(0xFF556DD3),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            // height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                "assets/images/ic_process.svg",
                                color: Color(0xFFF4F5F8),
                                height: 70,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "PROCESS STATION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Image.asset(
                                        "assets/images/ic_arrow_down.png",
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

  Widget _buildCardChemical() {
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
              MaterialPageRoute(builder: (context) => MotorDetailPage(2)),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                color: Color(0xFF556DD3),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            // height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                "assets/images/ic_chemical.svg",
                                color: Color(0xFFF4F5F8),
                                height: 70,
                              ),
                            ),
                          ),
                        ),
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
                                        "CHEMICAL STATION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Image.asset(
                                        "assets/images/ic_arrow_down.png",
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

  Widget _buildCardSludge() {
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
              MaterialPageRoute(builder: (context) => MotorDetailPage(3)),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                color: Color(0xFF556DD3),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            // height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                "assets/images/ic_chemical.svg",
                                color: Color(0xFFF4F5F8),
                                height: 70,
                              ),
                            ),
                          ),
                        ),
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
                                        "SLUDGE STATION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Image.asset(
                                        "assets/images/ic_arrow_down.png",
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

  Widget _buildCardSupply() {
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
              MaterialPageRoute(builder: (context) => MotorDetailPage(4)),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                color: Color(0xFF556DD3),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            // height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                "assets/images/ic_supply.svg",
                                color: Color(0xFFF4F5F8),
                                height: 70,
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   // color: Colors.blue,
                        //   height: 100,
                        //   width: 30,
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 20),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      // width: 100,
                                      child: Text(
                                        "SUPPLY STATION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Image.asset(
                                        "assets/images/ic_arrow_down.png",
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   // color: Colors.blue,
                        //   height: 100,
                        //   width: 80,
                        // ),
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

  loadData() {
    setState(() {
      isApiCallProcess = true;
    });
    APIService apiService = new APIService();
    apiService
        .getListMotor(userLocal.accessToken, factoryLocal.factoryId.toString())
        .then((value) {
      setState(() {
        isApiCallProcess = false;
      });
      if (value.statusCode == 200) {
        listData = value.data;
        print(value.toJson());
      }
    });
  }

  dialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Lỗi'),
        content: const Text('Không có dữ liệu'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
