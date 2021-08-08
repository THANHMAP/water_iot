import 'package:water_iot/model/electric/bieugiadien.dart';
import 'package:water_iot/model/electric/thongsodien.dart';

import 'chiphidien.dart';
import 'diennangtieuthu.dart';

class ElectricResponseModel {
  bool status;
  int statusCode;
  int errorCode;
  String message;
  Data data;

  ElectricResponseModel(
      {this.status, this.statusCode, this.message, this.errorCode, this.data});

  ElectricResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<ThongSoDien> thongSoDien;
  List<BieuGiaDien> bieuGiaDien;
  List<DienNangTieuThu> dienNangTieuThu;
  List<ChiPhiDien> chiPhiDien;

  Data(
      {this.thongSoDien,
        this.bieuGiaDien,
        this.dienNangTieuThu,
        this.chiPhiDien});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['thong_so_dien'] != null) {
      thongSoDien = [];
      json['thong_so_dien'].forEach((v) {
        thongSoDien.add(new ThongSoDien.fromJson(v));
      });
    }
    if (json['bieu_gia_dien'] != null) {
      bieuGiaDien = [];
      json['bieu_gia_dien'].forEach((v) {
        bieuGiaDien.add(new BieuGiaDien.fromJson(v));
      });
    }
    if (json['dien_nang_tieu_thu'] != null) {
      dienNangTieuThu = [];
      json['dien_nang_tieu_thu'].forEach((v) {
        dienNangTieuThu.add(new DienNangTieuThu.fromJson(v));
      });
    }
    if (json['chi_phi_dien'] != null) {
      chiPhiDien = [];
      json['chi_phi_dien'].forEach((v) {
        chiPhiDien.add(new ChiPhiDien.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thongSoDien != null) {
      data['thong_so_dien'] = this.thongSoDien.map((v) => v.toJson()).toList();
    }
    if (this.bieuGiaDien != null) {
      data['bieu_gia_dien'] = this.bieuGiaDien.map((v) => v.toJson()).toList();
    }
    if (this.dienNangTieuThu != null) {
      data['dien_nang_tieu_thu'] =
          this.dienNangTieuThu.map((v) => v.toJson()).toList();
    }
    if (this.chiPhiDien != null) {
      data['chi_phi_dien'] = this.chiPhiDien.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

