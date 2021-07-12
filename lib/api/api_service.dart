import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:water_iot/api/AppUrl.dart';
import 'package:water_iot/model/factory_model.dart';
import 'package:water_iot/model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = AppUrl.login;

    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    }
  }

  Future<FactoryResponseModel> getListFactory(String token) async {
    String url = AppUrl.list_factory;
    final response =
        await http.get(Uri.parse(url),
            headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 401 || response.statusCode == 500) {
      return FactoryResponseModel.fromJson(
        json.decode(response.body),
      );
    }
  }
}
