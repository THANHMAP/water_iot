import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/factory_model.dart';
import 'package:water_iot/model/login_model.dart';
import 'package:water_iot/screen/login/login.dart';
import 'package:water_iot/screen/main/main.dart';

import '../../ProgressHUD.dart';
import '../../SharedPref.dart';
import '../../constants.dart';

class FactoryPage extends StatefulWidget {
  @override
  _FactoryState createState() => _FactoryState();
}

class _FactoryState extends State<FactoryPage> {
  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<DataFactory> _factory;

  @override
  void initState() {
    super.initState();
    loadFactory();
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
            "FACTORY",
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
      body: Stack(
        children: <Widget>[
          _buildListView(),
          // ListView(
          //   children: <Widget>[_buildCard(), _buildCard2()],
          // ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: _factory == null ? 0 : _factory.length,
        itemBuilder: (context, index) {
          return _buildCard(_factory[index]);
          // return _buildRow(data[index]);
        });
  }

  Widget _buildCard(DataFactory item) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            factoryLocal = item;
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MainPage(0);
                },
              ),
              (route) => false,
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Row(
                      children: [
                        Flexible(
                          child: CachedNetworkImage(
                            imageUrl: item.thumbnail,
                            placeholder: (context, url) =>
                                new CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                            fadeOutDuration: new Duration(seconds: 1),
                            fadeInDuration: new Duration(seconds: 3),
                            fit: BoxFit.fill,
                          ),
                          // child: Image.network(
                          //   item.thumbnail,
                          //   fit: BoxFit.fill,
                          //   height: 170,
                          //   width: double.maxFinite,
                          // ),
                        ),
                      ],
                    ),
                    SizedBox(height: 13),
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              item.name,
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
                    SizedBox(height: 10),
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              item.address,
                              style: TextStyle(
                                color: textDashboardColor,
                                fontFamily: 'OpenSans',
                                fontSize: 17.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 17, horizontal: 60),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MainPage(0);
                                },
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            "Truy cập",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: loginButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // TextButton(
                        //   child: const Text('BUY TICKETS'),
                        //   onPressed: () {
                        //     /* ... */
                        //   },
                        // ),
                        // const SizedBox(width: 8),
                        // TextButton(
                        //   child: const Text('LISTEN'),
                        //   onPressed: () {
                        //     /* ... */
                        //   },
                        // ),
                        // const SizedBox(width: 8),
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

  loadFactory() async {
    setState(() {
      isApiCallProcess = true;
    });
    APIService apiService = new APIService();
    apiService.getListFactory(userLocal.accessToken).then((value) {
      print(value.toJson());
      setState(() {
        isApiCallProcess = false;
      });
      if (value != null) {
        if (value.statusCode == 200) {
          _factory = value.data;
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
      }
    }).catchError((onError){
      setState(() {
        isApiCallProcess = false;
      });
      final snackBar = SnackBar(
          content: Text("Lỗi server"));
      scaffoldKey.currentState
          .showSnackBar(snackBar);
    });
  }
}
