class DienNangTieuThu {
  String title;
  String type;
  List<DataList> dataList;

  DienNangTieuThu({this.title, this.type, this.dataList});

  DienNangTieuThu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
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
    data['type'] = this.type;
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
  DetailInfo thapDiem;
  DetailInfo binhThuong;
  DetailInfo caoDiem;
  DetailInfo tong;

  Info({this.thapDiem, this.binhThuong, this.caoDiem, this.tong});

  Info.fromJson(Map<String, dynamic> json) {
    thapDiem = json['thap_diem'] != null
        ? new DetailInfo.fromJson(json['thap_diem'])
        : null;
    binhThuong = json['binh_thuong'] != null
        ? new DetailInfo.fromJson(json['binh_thuong'])
        : null;
    caoDiem = json['cao_diem'] != null
        ? new DetailInfo.fromJson(json['cao_diem'])
        : null;
    tong = json['tong'] != null ? new DetailInfo.fromJson(json['tong']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thapDiem != null) {
      data['thap_diem'] = this.thapDiem.toJson();
    }
    if (this.binhThuong != null) {
      data['binh_thuong'] = this.binhThuong.toJson();
    }
    if (this.caoDiem != null) {
      data['cao_diem'] = this.caoDiem.toJson();
    }
    if (this.tong != null) {
      data['tong'] = this.tong.toJson();
    }
    return data;
  }
}

class DetailInfo {
  String thoiGian;
  int kwh;
  int chiPhi;

  DetailInfo({this.thoiGian, this.kwh, this.chiPhi});

  DetailInfo.fromJson(Map<String, dynamic> json) {
    if (json['thoi_gian'] != null) {
      thoiGian = json['thoi_gian'];
    } else {
      thoiGian = "";
    }

    if (json['kwh'] != null) {
      kwh = json['kwh'];
    } else {
      kwh = 0;
    }

    if (json['chi_phi'] != null) {
      chiPhi = json['chi_phi'];
    } else {
      chiPhi = 0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thoi_gian'] = this.thoiGian;
    data['kwh'] = this.kwh;
    data['chi_phi'] = this.chiPhi;
    return data;
  }
}
