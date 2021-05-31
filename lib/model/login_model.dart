class LoginRequestModel {
  String ip;
  String username;
  String password;

  LoginRequestModel({
    this.ip,
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'ip_factory': ip.trim(),
      'username': username.trim(),
      'password': password.trim(),
    };
    return map;
  }
}

class LoginResponseModel {
  bool status;
  int statusCode;
  String message;
  Data data;

  LoginResponseModel({this.status, this.statusCode, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int id;
  String name;
  String username;
  String email;
  int factoryId;
  List<Group> group;
  String lastLogin;
  String createdAt;
  String updatedAt;
  String accessToken;

  Data(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.factoryId,
      this.group,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    factoryId = json['factory_id'];
    if (json['group'] != null) {
      group = new List<Group>();
      json['group'].forEach((v) {
        group.add(new Group.fromJson(v));
      });
    }
    lastLogin = json['last_login'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['factory_id'] = this.factoryId;
    if (this.group != null) {
      data['group'] = this.group.map((v) => v.toJson()).toList();
    }
    data['last_login'] = this.lastLogin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['access_token'] = this.accessToken;
    return data;
  }
}

class Group {
  int id;
  String name;
  String code;

  Group({this.id, this.name, this.code});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
