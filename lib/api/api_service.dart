import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:water_iot/api/AppUrl.dart';
import 'package:water_iot/model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = AppUrl.baseURL + AppUrl.login;

    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
