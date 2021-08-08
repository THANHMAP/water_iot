import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:water_iot/SharedPref.dart';
import 'package:water_iot/api/AppUrl.dart';
import 'package:water_iot/model/CustomerResponseModel.dart';
import 'package:water_iot/model/change_password_model.dart';
import 'package:water_iot/model/chemical/chemical.dart';
import 'package:water_iot/model/electric/electric_model.dart';
import 'package:water_iot/model/factory_model.dart';
import 'package:water_iot/model/flowmeter/flowmeter.dart';
import 'package:water_iot/model/login_model.dart';
import 'package:water_iot/model/motor.dart';
import 'package:water_iot/model/report_model.dart';
import 'package:water_iot/model/sensor_model.dart';
import 'package:water_iot/model/valve_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = AppUrl.login;
    try {
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
    } on SocketException catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<FactoryResponseModel> getListFactory(String token) async {
    String url = AppUrl.list_factory;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'customer_id': customerId},
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 500) {
        return FactoryResponseModel.fromJson(
          json.decode(response.body),
        );
      }
      return null;
    } on SocketException catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<CustomerResponseModel> getListCustomer(String token) async {
    String url = AppUrl.get_list_customer;
    try {
      final response = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 500) {
        return CustomerResponseModel.fromJson(
          json.decode(response.body),
        );
      }
      return null;
    } on SocketException catch (e) {
      throw Exception('Failed to load');
    }
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
        body: {'factory_id': factoryId},
        headers: {'Authorization': 'Bearer $token'});
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
    final response = await http.post(Uri.parse(url), body: {
      'id_set_point': idSetpoint,
      'field_set_point': fieldPoint,
      'value_set_point': value
    }, headers: {
      'Authorization': 'Bearer $token'
    });
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

  Future<MotorResponse> getListMotor(String token, String factoryId) async {
    String url = AppUrl.get_list_motor;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'factory_id': factoryId},
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 500) {
        return MotorResponse.fromJson(
          json.decode(response.body),
        );
      }
      return null;
    } on SocketException catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<ElectricResponseModel> getListElectrical(String factoryId) async {
    String url = AppUrl.get_static_electrical;
    String token = userLocal.accessToken;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'factory_id': factoryId},
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 500) {
        return ElectricResponseModel.fromJson(
          json.decode(response.body),
        );
      }
      return null;
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

  Future<ChemicalResponse> getListChemical(String factoryId) async {
    String url = AppUrl.get_static_chemical;
    String token = userLocal.accessToken;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'factory_id': factoryId},
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 500) {
        return ChemicalResponse.fromJson(
          json.decode(response.body),
        );
      }
      return null;
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

  Future<FlowmeterResponse> getListFlowmeter(String factoryId) async {
    String url = AppUrl.get_static_flowmeter;
    String token = userLocal.accessToken;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'factory_id': factoryId},
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 500) {
        return FlowmeterResponse.fromJson(
          json.decode(response.body),
        );
      }
      return null;
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

  Future<ValveResponseModel> getListValve(
      String token, String factoryId) async {
    String url = AppUrl.get_list_valve;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'factory_id': factoryId},
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 500) {
        return ValveResponseModel.fromJson(
          json.decode(response.body),
        );
      }
      return null;
    } on SocketException catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<AvatarResponseModel> uploadImageHTTP(file) async {
    String token = userLocal.accessToken;
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(AppUrl.upload_avatar));
      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('avatar', file.path));
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 500) {
        return AvatarResponseModel.fromJson(
          json.decode(response.body),
        );
      }
      return null;
    } on SocketException catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<ReportResponse> getReportElectrical(String factoryId, String fromDate, String toDate) async {
    String url = AppUrl.get_report_electrical;
    String token = userLocal.accessToken;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'factory_id': factoryId, 'from_date': fromDate, 'to_date': toDate},
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 500) {
        return ReportResponse.fromJson(
          json.decode(response.body),
        );
      }
      return null;
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

}

class ResponseNormal {
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

class AvatarResponseModel {
  bool status;
  int statusCode;
  String message;
  DataAvatar data;

  AvatarResponseModel({this.status, this.statusCode, this.message, this.data});

  AvatarResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new DataAvatar.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DataAvatar {
  String avatar;

  DataAvatar({this.avatar});

  DataAvatar.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    return data;
  }
}
