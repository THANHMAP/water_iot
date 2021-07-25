class ValveResponseModel {
  bool status;
  int statusCode;
  String message;
  List<Data> data;

  ValveResponseModel({this.status, this.statusCode, this.message, this.data});

  ValveResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String title;
  List<DataValve> dataValve;

  Data({this.title, this.dataValve});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data_valve'] != null) {
      dataValve = new List<DataValve>();
      json['data_valve'].forEach((v) {
        dataValve.add(new DataValve.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.dataValve != null) {
      data['data_valve'] = this.dataValve.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataValve {
  String name;
  String symbol;
  int status;
  String statusName;
  String statusColor;
  int operationStatus;
  String operationStatusName;
  String operationStatusColor;
  int totalfo;
  int totalfc;
  int totaloc;

  DataValve(
      {this.name,
        this.symbol,
        this.status,
        this.statusName,
        this.statusColor,
        this.operationStatus,
        this.operationStatusName,
        this.operationStatusColor,
        this.totalfo,
        this.totalfc,
        this.totaloc});

  DataValve.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    status = json['status'];
    statusName = json['status_name'];
    statusColor = json['status_color'];
    operationStatus = json['operation_status'];
    operationStatusName = json['operation_status_name'];
    operationStatusColor = json['operation_status_color'];
    totalfo = json['totalfo'];
    totalfc = json['totalfc'];
    totaloc = json['totaloc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['status'] = this.status;
    data['status_name'] = this.statusName;
    data['status_color'] = this.statusColor;
    data['operation_status'] = this.operationStatus;
    data['operation_status_name'] = this.operationStatusName;
    data['operation_status_color'] = this.operationStatusColor;
    data['totalfo'] = this.totalfo;
    data['totalfc'] = this.totalfc;
    data['totaloc'] = this.totaloc;
    return data;
  }
}
