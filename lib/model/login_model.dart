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

class UpdateInfoRequestModel {
  String name;
  String gender;
  String email;
  String birthday;
  String phone;
  String address;

  UpdateInfoRequestModel(
      {this.name,
      this.gender,
      this.email,
      this.birthday,
      this.phone,
      this.address});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name.trim(),
      'gender': gender.trim(),
      'email': email.trim(),
      'birthday': birthday.trim(),
      'phone': phone.trim(),
      'address': address.trim(),
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
  Factory factory;
  String phone;
  String address;
  String birthday;
  String gender;
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
      this.factory,
      this.phone,
      this.address,
      this.birthday,
      this.gender,
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
    factory =
        json['factory'] != null ? new Factory.fromJson(json['factory']) : null;
    phone = json['phone'];
    address = json['address'];
    birthday = json['birthday'];
    gender = json['gender'];
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
    if (this.factory != null) {
      data['factory'] = this.factory.toJson();
    }
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
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

class Factory {
  int id;
  String name;
  String thumbnail;
  String overview;
  int factoryId;
  String address;
  String ip;

  Factory(
      {this.id,
      this.name,
      this.thumbnail,
      this.overview,
      this.factoryId,
      this.address,
      this.ip});

  Factory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    overview = json['overview'];
    factoryId = json['factory_id'];
    address = json['address'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    data['overview'] = this.overview;
    data['factory_id'] = this.factoryId;
    data['address'] = this.address;
    data['ip'] = this.ip;
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
