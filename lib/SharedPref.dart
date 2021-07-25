import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_iot/model/factory_model.dart';

import 'model/login_model.dart';

String imgOverViewUrl;
String nameFactory;
String factoryId;
String customerId;
DataFactory factoryLocal;
List<DataFactory> listFactoryLocal = [];
Data userLocal;
Future<Data> getUserInfo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  Map<String, dynamic> userMap;
  final String userStr = prefs.getString('InfoUser');
  if (userStr != null) {
    userMap = jsonDecode(userStr) as Map<String, dynamic>;
  }

  if (userMap != null) {
    final Data user = Data.fromJson(userMap);
    // imgOverViewUrl = user.factory.overview;
    // factoryId = user.factory.factoryId.toString();
    // addFactory(user);
    customerId = user.customer.id.toString();
    userLocal = user;
    print(user);
    return user;
  }
  return null;
}

addFactory(Data user) {
  DataFactory dataFactory = DataFactory();
  // dataFactory.id = user.factory.id;
  // dataFactory.name = user.factory.name;
  // dataFactory.thumbnail = user.factory.thumbnail;
  // dataFactory.overview = user.factory.overview;
  // dataFactory.factoryId = user.factory.factoryId;
  // dataFactory.address = user.factory.address;
  // dataFactory.ip = user.factory.ip;
  listFactoryLocal.add(dataFactory);
}

Future<void> deleteUserInfo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool result = await prefs.remove('InfoUser');
  print(result);
}

Future<void> saveUserInfo(Data data) async {
  userLocal = data;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool result = await prefs.setString('InfoUser', jsonEncode(data));
  // imgOverViewUrl = data.factory.overview;
  // factoryId = data.factory.factoryId.toString();
  print(data.toJson());
  print(result);
}


