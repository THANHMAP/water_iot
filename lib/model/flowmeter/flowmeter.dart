class FlowmeterResponse {
  bool status;
  int statusCode;
  int errorCode;
  String message;
  Data data;

  FlowmeterResponse({this.status, this.statusCode, this.errorCode, this.message, this.data});

  FlowmeterResponse.fromJson(Map<String, dynamic> json) {
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
  List<LuuLuongData> luuLuongDauVao;
  List<LuuLuongData> luuLuongHaoPhi;
  List<LuuLuongData> luuLuongBanRa;

  Data({this.luuLuongDauVao, this.luuLuongHaoPhi, this.luuLuongBanRa});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['luu_luong_dau_vao'] != null) {
      luuLuongDauVao = [];
      json['luu_luong_dau_vao'].forEach((v) {
        luuLuongDauVao.add(new LuuLuongData.fromJson(v));
      });
    }
    if (json['luu_luong_hao_phi'] != null) {
      luuLuongHaoPhi = [];
      json['luu_luong_hao_phi'].forEach((v) {
        luuLuongHaoPhi.add(new LuuLuongData.fromJson(v));
      });
    }
    if (json['luu_luong_ban_ra'] != null) {
      luuLuongBanRa = [];
      json['luu_luong_ban_ra'].forEach((v) {
        luuLuongBanRa.add(new LuuLuongData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.luuLuongDauVao != null) {
      data['luu_luong_dau_vao'] =
          this.luuLuongDauVao.map((v) => v.toJson()).toList();
    }
    if (this.luuLuongHaoPhi != null) {
      data['luu_luong_hao_phi'] =
          this.luuLuongHaoPhi.map((v) => v.toJson()).toList();
    }
    if (this.luuLuongBanRa != null) {
      data['luu_luong_ban_ra'] =
          this.luuLuongBanRa.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LuuLuongData {
  String title;
  List<DataList> dataList;

  LuuLuongData({this.title, this.dataList});

  LuuLuongData.fromJson(Map<String, dynamic> json) {
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
  String title;
  List<Info> info;

  DataList({this.title, this.info});

  DataList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['info'] != null) {
      info = [];
      json['info'].forEach((v) {
        info.add(new Info.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.info != null) {
      data['info'] = this.info.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int value;
  String unit;

  Info({this.value, this.unit});

  Info.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unit'] = this.unit;
    return data;
  }
}

