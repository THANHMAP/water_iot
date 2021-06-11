import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/screen/main/main.dart';
import 'package:water_iot/screen/main/setting.dart';

import '../../constants.dart';

class DevicePage extends StatefulWidget {
  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
          title: Text(
            "DEVICE",
            style: TextStyle(color: mTexHeadLoginColor),
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
                            'HA THANH WATER SUPPLY FACTORY 30.000m3 Capacity',
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
                        Center(
                          child: Text(
                            'MONITORING & SCALLING SENSOR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF00B500),
                              fontFamily: 'OpenSans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Column(children: <Widget>[
                            _buildCardPUMP(),
                            _buildCardProcess(),
                            _buildCardChemical(),
                            _buildCardSupply(),
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

  Widget _buildCardPUMP() {
    return Padding(
      padding: const EdgeInsets.all(0),
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
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,

                                      child: Text(
                                        "RAW PUMP STATION",
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
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 80,
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
          onTap: () {},
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
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 30,
                        ),
                        Expanded(
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
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 80,
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
          onTap: () {},
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
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 30,
                        ),
                        Expanded(
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
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 80,
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
          onTap: () {},
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
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 30,
                        ),
                        Expanded(
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
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 80,
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