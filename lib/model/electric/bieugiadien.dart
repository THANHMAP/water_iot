import 'dart:convert';

class BieuGiaDien {
  String title;
  String type;
  List<DataList> dataList;

  BieuGiaDien({this.title, this.type, this.dataList});

  BieuGiaDien.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    if (json['data_list'] != null) {
      dataList = new List<DataList>();
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
  InfoBieuGiaDien infoBieuGiaDien;
  InfoDienNangTieuThu infoDienNangTieuThu;

  DataList({this.title, this.infoBieuGiaDien, this.infoDienNangTieuThu});

  DataList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if(json['info'] != null){
      var jsonResponse = json['info'];
      if(jsonResponse.containsKey("trong_ngay")){
        infoDienNangTieuThu = json['info'] != null ? new InfoDienNangTieuThu.fromJson(json['info']) : null;
      }else{
        infoBieuGiaDien = json['info'] != null ? new InfoBieuGiaDien.fromJson(json['info']) : null;
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.infoBieuGiaDien != null) {
      data['info'] = this.infoBieuGiaDien.toJson();
    }
    return data;
  }
}


class InfoBieuGiaDien {
  DetailInfo thapDiem;
  DetailInfo binhThuong;
  DetailInfo caoDiem;

  InfoBieuGiaDien(
      {this.thapDiem,
        this.binhThuong,
        this.caoDiem});

  InfoBieuGiaDien.fromJson(Map<String, dynamic> json) {
    thapDiem = json['thap_diem'] != null
        ? new DetailInfo.fromJson(json['thap_diem'])
        : null;
    binhThuong = json['binh_thuong'] != null
        ? new DetailInfo.fromJson(json['binh_thuong'])
        : null;
    caoDiem = json['cao_diem'] != null
        ? new DetailInfo.fromJson(json['cao_diem'])
        : null;
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
    return data;
  }
}

class InfoDienNangTieuThu {
  DetailInfo trongNgay;
  DetailInfo trongThang;
  DetailInfo trongNam;
  DetailInfo tong;

  InfoDienNangTieuThu(
      {
        this.trongNgay,
        this.trongThang,
        this.trongNam,
        this.tong});

  InfoDienNangTieuThu.fromJson(Map<String, dynamic> json) {
    trongNgay = json['trong_ngay'] != null
        ? new DetailInfo.fromJson(json['trong_ngay'])
        : null;
    trongThang = json['trong_thang'] != null
        ? new DetailInfo.fromJson(json['trong_thang'])
        : null;
    trongNam = json['trong_nam'] != null
        ? new DetailInfo.fromJson(json['trong_nam'])
        : null;
    tong = json['tong'] != null ? new DetailInfo.fromJson(json['tong']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trongNgay != null) {
      data['trong_ngay'] = this.trongNgay.toJson();
    }
    if (this.trongThang != null) {
      data['trong_thang'] = this.trongThang.toJson();
    }
    if (this.trongNam != null) {
      data['trong_nam'] = this.trongNam.toJson();
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
  int thanhTien;

  DetailInfo({this.thoiGian, this.kwh, this.thanhTien});

  DetailInfo.fromJson(Map<String, dynamic> json) {
    if(json['thoi_gian'] != null){
      thoiGian = json['thoi_gian'];
    }else{
      thoiGian = "";
    }

    if(json['kwh'] != null){
      kwh = json['kwh'];
    }else{
      kwh = 0;
    }

    if(json['thanh_tien'] != null){
      thanhTien = json['thanh_tien'];
    }else{
      thanhTien = 0;
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thoi_gian'] = this.thoiGian;
    data['kwh'] = this.kwh;
    data['thanh_tien'] = this.thanhTien;
    return data;
  }
}
