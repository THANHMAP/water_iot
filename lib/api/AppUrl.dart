class AppUrl {
  static const String baseURL = "https://www.ptewater.com/admin/api/v1";
  static const String login = baseURL + "/user/login";
  static const String list_factory = baseURL + "/factory/list";
  static const String list_factory_detail = baseURL + "/factory/detail";
  static const String change_password = baseURL + "/user/change-password";
  static const String update_account = baseURL + "/user/update-account";
  static const String get_list_sensor = baseURL + "/sensor/list";
  static const String update_sensor = baseURL + "/sensor/update-set-point";
  static const String get_list_motor = baseURL + "/motor/list";
  static const String get_list_valve = baseURL + "/valve/list";
  static const String get_list_customer = baseURL + "/customer/list";
  static const String upload_avatar= baseURL + "/user/update-avatar";
  static const String get_static_electrical= baseURL + "/statistic/electrical";
  static const String get_static_chemical= baseURL + "/statistic/chemical";
  static const String get_static_flowmeter= baseURL + "/statistic/flowmeter";
  static const String get_report_electrical= baseURL + "/report/electrical";

  // static const String forgotPassword = baseURL + "/forgot-password";
}