import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:water_iot/api/AppUrl.dart';
import 'package:water_iot/model/change_password_model.dart';
import 'package:water_iot/model/factory_model.dart';
import 'package:water_iot/model/login_model.dart';
import 'package:water_iot/model/motor.dart';
import 'package:water_iot/model/sensor_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = AppUrl.login;

    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    }
    return null;
  }

  Future<FactoryResponseModel> getListFactory(String token) async {
    String url = AppUrl.list_factory;
    final response = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 500) {
      return FactoryResponseModel.fromJson(
        json.decode(response.body),
      );
    }
    return null;
  }

  Future<ChangePasswordResponseModel> changePassword(String token,
      ChangePasswordRequestModel changePasswordRequestModel) async {
    String url = AppUrl.change_password;
    final response = await http.post(Uri.parse(url),
        body: changePasswordRequestModel.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 500) {
      return ChangePasswordResponseModel.fromJson(
        json.decode(response.body),
      );
    }
    return null;
  }

  Future<LoginResponseModel> updatePersonalInfo(
      String token, UpdateInfoRequestModel updateInfoRequestModel) async {
    String url = AppUrl.update_account;
    final response = await http.post(Uri.parse(url),
        body: updateInfoRequestModel.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 500) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    }
    return null;
  }

  Future<SensorResponseModel> getListSensor(
      String token, String factoryId) async {
    String url = AppUrl.get_list_sensor;
    final response = await http.post(Uri.parse(url),
        body: {'factory_id': factoryId}, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 500) {
      return SensorResponseModel.fromJson(
        json.decode(response.body),
      );
    }
    return null;
  }

  Future<ResponseNormal> updateSetpoint(
      String token, String idSetpoint, String fieldPoint, String value) async {
    String url = AppUrl.update_sensor;
    final response = await http.post(Uri.parse(url),
        body: {'id_set_point': idSetpoint, 'field_set_point': fieldPoint, 'value_set_point': value}, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 500) {
      return ResponseNormal.fromJson(
        json.decode(response.body),
      );
    }
    return null;
  }

  Future<MotorResponse> getListMotor(
      String token, String factoryId) async {
    String url = AppUrl.get_list_motor;
    final response = await http.post(Uri.parse(url),
        body: {'factory_id': factoryId}, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 500) {
      return MotorResponse.fromJson(
        json.decode(response.body),
      );
    }
    return null;
  }

}

class ResponseNormal{
  bool status;
  int statusCode;
  String message;
  ResponseNormal({this.status, this.statusCode, this.message});

  ResponseNormal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
