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
  int errorCode;
  Data data;

  LoginResponseModel(
      {this.status, this.statusCode, this.message, this.errorCode, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    errorCode = json['error_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    data['error_code'] = this.errorCode;
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
  Customer customer;
  String phone;
  String address;
  String birthday;
  Null gender;
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
      this.customer,
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
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
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
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
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

class Customer {
  int id;
  String name;
  String logo;

  Customer({this.id, this.name, this.logo});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
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
