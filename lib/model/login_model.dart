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
  final String token;
  final String error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}
