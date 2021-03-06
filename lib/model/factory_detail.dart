class FactoryDetailResponse {
  bool status;
  int statusCode;
  int errorCode;
  String message;
  Data data;

  FactoryDetailResponse(
      {this.status, this.statusCode, this.errorCode, this.message, this.data});

  FactoryDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    errorCode = json['error_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  int factoryId;
  String name;
  String ip;
  String langtitude;
  String longtitude;
  String address;
  String thumbnail;
  String overview;
  String overviewApp;

  Data(
      {this.id,
        this.factoryId,
        this.name,
        this.ip,
        this.langtitude,
        this.longtitude,
        this.address,
        this.thumbnail,
        this.overview,
        this.overviewApp});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    factoryId = json['factory_id'];
    name = json['name'];
    ip = json['ip'];
    langtitude = json['langtitude'];
    longtitude = json['longtitude'];
    address = json['address'];
    thumbnail = json['thumbnail'];
    overview = json['overview'];
    overviewApp = json['overview_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['factory_id'] = this.factoryId;
    data['name'] = this.name;
    data['ip'] = this.ip;
    data['langtitude'] = this.langtitude;
    data['longtitude'] = this.longtitude;
    data['address'] = this.address;
    data['thumbnail'] = this.thumbnail;
    data['overview'] = this.overview;
    data['overview_app'] = this.overviewApp;
    return data;
  }
}
