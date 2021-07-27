import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_iot/SharedPref.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/CustomerResponseModel.dart';
import 'package:water_iot/screen/factory/factory_admin.dart';
import 'package:water_iot/screen/login/login.dart';
import 'package:water_iot/screen/main/main.dart';

import '../../ProgressHUD.dart';
import '../../constants.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<CustomerPage> {
  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Data> _customers;

  @override
  void initState() {
    super.initState();
    loadCustomers();
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
            "Khách Hàng",
            // style: TextStyle(color: mTexHeadLoginColor),
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
        itemCount: _customers == null ? 0 : _customers.length,
        itemBuilder: (context, index) {
          return _buildCard(_customers[index]);
          // return _buildRow(data[index]);
        });
  }

  Widget _buildCard(Data item) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            customerId = item.id.toString();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => FactoryAminPage(),
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
                            imageUrl: item.logo,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 180,
                              width: 400,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
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
                    SizedBox(height: 18),
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                color: textDashboardColor,
                                fontFamily: 'OpenSans',
                                fontSize: 25.0,
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
                    // SizedBox(height: 10),
                    // new Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         child: Text(
                    //           "item.address",
                    //           style: TextStyle(
                    //             color: textDashboardColor,
                    //             fontFamily: 'OpenSans',
                    //             fontSize: 17.0,
                    //             fontWeight: FontWeight.normal,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 17, horizontal: 60),
                          onPressed: () {
                            customerId = item.id.toString();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FactoryAminPage(),
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

  loadCustomers() async {
    setState(() {
      isApiCallProcess = true;
    });
    APIService apiService = new APIService();
    apiService.getListCustomer(userLocal.accessToken).then((value) {
      print(value.toJson());
      setState(() {
        isApiCallProcess = false;
      });
      if (value != null) {
        if (value.statusCode == 200) {
          _customers = value.data;
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
}
