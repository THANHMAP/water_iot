class KhoHoaChat {
  String title;
  String unit;
  List<DataList> dataList;

  KhoHoaChat({this.title, this.unit, this.dataList});

  KhoHoaChat.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    unit = json['unit'];
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
    data['unit'] = this.unit;
    if (this.dataList != null) {
      data['data_list'] = this.dataList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
  String title;
  Info info;

  DataList({this.title, this.info});

  DataList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}

class Info {
  int khoiLuongConLai;
  int khoiLuongDaNhap;

  Info({this.khoiLuongConLai, this.khoiLuongDaNhap});

  Info.fromJson(Map<String, dynamic> json) {
    khoiLuongConLai = json['khoi_luong_con_lai'];
    khoiLuongDaNhap = json['khoi_luong_da_nhap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['khoi_luong_con_lai'] = this.khoiLuongConLai;
    data['khoi_luong_da_nhap'] = this.khoiLuongDaNhap;
    return data;
  }
}
