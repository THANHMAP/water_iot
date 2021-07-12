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
