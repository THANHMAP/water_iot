class ReportResponse {
  bool status;
  int statusCode;
  int errorCode;
  String message;
  List<Data> data;

  ReportResponse({this.status, this.statusCode, this.errorCode, this.message, this.data});

  ReportResponse.fromJson(Map<String, dynamic> json) {
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
  int id;
  String timeStamp;
  int tram1;
  int tram2;
  int tram3;
  int tram4;
  int tram5;
  int tram6;
  int tram7;
  int tram8;
  int tram9;
  int tram10;
  int total;
  int totalStation;

  Data(
      {this.id,
        this.timeStamp,
        this.tram1,
        this.tram2,
        this.tram3,
        this.tram4,
        this.tram5,
        this.tram6,
        this.tram7,
        this.tram8,
        this.tram9,
        this.tram10,
        this.total,
        this.totalStation});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timeStamp = json['timeStamp'];
    tram1 = json['tram1'];
    tram2 = json['tram2'];
    tram3 = json['tram3'];
    tram4 = json['tram4'];
    tram5 = json['tram5'];
    tram6 = json['tram6'];
    tram7 = json['tram7'];
    tram8 = json['tram8'];
    tram9 = json['tram9'];
    tram10 = json['tram10'];
    total = json['total'];
    totalStation = json['total_station'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timeStamp'] = this.timeStamp;
    data['tram1'] = this.tram1;
    data['tram2'] = this.tram2;
    data['tram3'] = this.tram3;
    data['tram4'] = this.tram4;
    data['tram5'] = this.tram5;
    data['tram6'] = this.tram6;
    data['tram7'] = this.tram7;
    data['tram8'] = this.tram8;
    data['tram9'] = this.tram9;
    data['tram10'] = this.tram10;
    data['total'] = this.total;
    data['total_station'] = this.totalStation;
    return data;
  }
}
