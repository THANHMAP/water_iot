import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_iot/SharedPref.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/factory_model.dart';
import 'package:water_iot/model/login_model.dart';
import 'package:water_iot/screen/login/login.dart';
import 'package:water_iot/screen/main/main.dart';

import '../../ProgressHUD.dart';
import '../../constants.dart';

class FactoryAminPage extends StatefulWidget {
  @override
  _FactoryState createState() => _FactoryState();
}

class _FactoryState extends State<FactoryAminPage> {
  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<DataFactory> _factory;

  @override
  void initState() {
    super.initState();
    // Call the getJSONData() method when the app initializes
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
      key: scaffoldKey,
      appBar: AppBar(
          title: Text(
            "Nhà Máy",
            style: TextStyle(color: mTexHeadLoginColor),
          ),
          centerTitle: true),
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
                builder: (context) => MainPage(),
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
                            // height: 160,
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
                          flex: 1,
                          child: Container(
                              child: CachedNetworkImage(
                                imageUrl:  item.logoCustomer,
                                imageBuilder: (context, imageProvider) => Container(
                                  height: 60,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
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
                              vertical: 13, horizontal: 30),
                          onPressed: () {
                            factoryLocal = item;
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
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
          listFactoryLocal = _factory;
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
    }).catchError((onError) {
      setState(() {
        isApiCallProcess = false;
      });
      final snackBar = SnackBar(content: Text("Lỗi server"));
      scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }

  Future<Data> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap;
    final String userStr = prefs.getString('InfoUser');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final Data user = Data.fromJson(userMap);
      print(user);
      return user;
    }
    return null;
  }
}
