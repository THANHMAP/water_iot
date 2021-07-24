class SensorRequestModel {
  String factoryID;

  SensorRequestModel({this.factoryID});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'factory_id': factoryID.trim()};
    return map;
  }
}

class SensorResponseModel {
  bool status;
  int statusCode;
  String message;
  List<Data> data;

  SensorResponseModel({this.status, this.statusCode, this.message, this.data});

  SensorResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
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
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String title;
  List<DataList> dataList;

  Data({this.title, this.dataList});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data_list'] != null) {
      dataList = [];
      json['data_list'].forEach((v) {
        dataList.add(new DataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.dataList != null) {
      data['data_list'] = this.dataList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
  String name;
  String symbol;
  String setPoint;
  String editSetPoint;
  String fieldSetPoint;
  String idSetPoint;
  String updateStatus;
  List<DataSensor> dataSensor;

  DataList(
      {this.name,
        this.symbol,
        this.setPoint,
        this.editSetPoint,
        this.fieldSetPoint,
        this.idSetPoint,
        this.updateStatus,
        this.dataSensor});

  DataList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    setPoint = json['set_point'];
    editSetPoint = json['edit_set_point'];
    fieldSetPoint = json['field_set_point'];
    idSetPoint = json['id_set_point'];
    if (json['data_sensor'] != null) {
      dataSensor = [];
      json['data_sensor'].forEach((v) {
        dataSensor.add(new DataSensor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['set_point'] = this.setPoint;
    data['edit_set_point'] = this.editSetPoint;
    data['field_set_point'] = this.fieldSetPoint;
    data['id_set_point'] = this.idSetPoint;
    if (this.dataSensor != null) {
      data['data_sensor'] = this.dataSensor.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataSensor {
  String value;
  String unit;
  String isPercent;

  DataSensor({this.value, this.unit, this.isPercent});

  DataSensor.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
    isPercent = json['is_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unit'] = this.unit;
    data['is_percent'] = this.isPercent;
    return data;
  }
}





