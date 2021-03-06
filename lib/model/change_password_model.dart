class ChangePasswordRequestModel {
  String newPassword;
  String confirmPassword;

  ChangePasswordRequestModel({
    this.newPassword,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'new_password': newPassword.trim(),
      'confirm_password': confirmPassword.trim()
    };
    return map;
  }
}

class ChangePasswordResponseModel {
  bool status;
  int statusCode;
  int errorCode;
  String message;
  ChangePasswordResponseModel({this.status, this.statusCode, this.errorCode, this.message});

  ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    errorCode = json['error_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    return data;
  }
}
