class MotorResponse {
  bool status;
  int statusCode;
  int errorCode;
  String message;
  List<Data> data;

  MotorResponse({this.status, this.statusCode, this.errorCode, this.message, this.data});

  MotorResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    errorCode = json['error_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String title;
  List<DataMotor> dataMotor;

  Data({this.title, this.dataMotor});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data_motor'] != null) {
      dataMotor = [];
      json['data_motor'].forEach((v) {
        dataMotor.add(new DataMotor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.dataMotor != null) {
      data['data_motor'] = this.dataMotor.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataMotor {
  String name;
  String symbol;
  int status;
  String statusIdentity;
  String statusName;
  String statusColor;
  int operationStatus;
  String operationStatusName;
  String operationStatusColor;
  int totalovl;
  int totalnrf;
  int totalrt;

  DataMotor(
      {this.name,
        this.symbol,
        this.status,
        this.statusIdentity,
        this.statusName,
        this.statusColor,
        this.operationStatus,
        this.operationStatusName,
        this.operationStatusColor,
        this.totalovl,
        this.totalnrf,
        this.totalrt});

  DataMotor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    status = json['status'];
    statusIdentity = json['status_identity'];
    statusName = json['status_name'];
    statusColor = json['status_color'];
    operationStatus = json['operation_status'];
    operationStatusName = json['operation_status_name'];
    operationStatusColor = json['operation_status_color'];
    totalovl = json['totalovl'];
    totalnrf = json['totalnrf'];
    totalrt = json['totalrt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['status'] = this.status;
    data['status_identity'] = this.statusIdentity;
    data['status_name'] = this.statusName;
    data['status_color'] = this.statusColor;
    data['operation_status'] = this.operationStatus;
    data['operation_status_name'] = this.operationStatusName;
    data['operation_status_color'] = this.operationStatusColor;
    data['totalovl'] = this.totalovl;
    data['totalnrf'] = this.totalnrf;
    data['totalrt'] = this.totalrt;
    return data;
  }
}
