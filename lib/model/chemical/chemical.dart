import 'package:water_iot/model/chemical/bieugiahoachat.dart';

import 'chiphihoachat.dart';
import 'congthuchoachat.dart';
import 'hoachattieuthu.dart';
import 'khohoachat.dart';

class ChemicalResponse {
  bool status;
  int statusCode;
  int errorCode;
  String message;
  Data data;

  ChemicalResponse({this.status, this.statusCode, this.errorCode, this.message, this.data});

  ChemicalResponse.fromJson(Map<String, dynamic> json) {
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
  DataChemical voi;
  DataChemical pac;
  DataChemical polyme;
  DataChemical clo;
  DataChemical other;

  Data({this.voi, this.pac, this.polyme, this.clo, this.other});

  Data.fromJson(Map<String, dynamic> json) {
    voi = json['voi'] != null ? new DataChemical.fromJson(json['voi']) : null;
    pac = json['pac'] != null ? new DataChemical.fromJson(json['pac']) : null;
    polyme = json['polyme'] != null ? new DataChemical.fromJson(json['polyme']) : null;
    clo = json['clo'] != null ? new DataChemical.fromJson(json['clo']) : null;
    other = json['other'] != null ? new DataChemical.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.voi != null) {
      data['voi'] = this.voi.toJson();
    }
    if (this.pac != null) {
      data['pac'] = this.pac.toJson();
    }
    if (this.polyme != null) {
      data['polyme'] = this.polyme.toJson();
    }
    if (this.clo != null) {
      data['clo'] = this.clo.toJson();
    }
    if (this.other != null) {
      data['other'] = this.other.toJson();
    }
    return data;
  }
}

class DataChemical {
  CongThucHoaChat congThucHoaChat;
  KhoHoaChat khoHoaChat;
  HoaChatTieuThu hoaChatTieuThu;
  BieuGiaHoaChat bieuGiaHoaChat;
  ChiPhiHoaChat chiPhiHoaChat;

  DataChemical(
      {this.congThucHoaChat,
        this.khoHoaChat,
        this.hoaChatTieuThu,
        this.bieuGiaHoaChat,
        this.chiPhiHoaChat});

  DataChemical.fromJson(Map<String, dynamic> json) {
    congThucHoaChat = json['cong_thuc_hoa_chat'] != null
        ? new CongThucHoaChat.fromJson(json['cong_thuc_hoa_chat'])
        : null;
    khoHoaChat = json['kho_hoa_chat'] != null
        ? new KhoHoaChat.fromJson(json['kho_hoa_chat'])
        : null;
    hoaChatTieuThu = json['hoa_chat_tieu_thu'] != null
        ? new HoaChatTieuThu.fromJson(json['hoa_chat_tieu_thu'])
        : null;
    bieuGiaHoaChat = json['bieu_gia_hoa_chat'] != null
        ? new BieuGiaHoaChat.fromJson(json['bieu_gia_hoa_chat'])
        : null;
    chiPhiHoaChat = json['chi_phi_hoa_chat'] != null
        ? new ChiPhiHoaChat.fromJson(json['chi_phi_hoa_chat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.congThucHoaChat != null) {
      data['cong_thuc_hoa_chat'] = this.congThucHoaChat.toJson();
    }
    if (this.khoHoaChat != null) {
      data['kho_hoa_chat'] = this.khoHoaChat.toJson();
    }
    if (this.hoaChatTieuThu != null) {
      data['hoa_chat_tieu_thu'] = this.hoaChatTieuThu.toJson();
    }
    if (this.bieuGiaHoaChat != null) {
      data['bieu_gia_hoa_chat'] = this.bieuGiaHoaChat.toJson();
    }
    if (this.chiPhiHoaChat != null) {
      data['chi_phi_hoa_chat'] = this.chiPhiHoaChat.toJson();
    }
    return data;
  }
}

// class Data {
//   CongThucPhaHoaChat congThucPhaHoaChat;
//   List<KhoHoaChat> khoHoaChat;
//   List<HoaChatTieuThu> hoaChatTieuThu;
//   BieuGiaHoaChat bieuGiaHoaChat;
//   List<ChiPhiHoaChat> chiPhiHoaChat;
//
//   Data(
//       {this.congThucPhaHoaChat,
//         this.khoHoaChat,
//         this.hoaChatTieuThu,
//         this.bieuGiaHoaChat,
//         this.chiPhiHoaChat});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     congThucPhaHoaChat = json['cong_thuc_pha_hoa_chat'] != null
//         ? new CongThucPhaHoaChat.fromJson(json['cong_thuc_pha_hoa_chat'])
//         : null;
//     if (json['kho_hoa_chat'] != null) {
//       khoHoaChat = [];
//       json['kho_hoa_chat'].forEach((v) {
//         khoHoaChat.add(new KhoHoaChat.fromJson(v));
//       });
//     }
//     if (json['hoa_chat_tieu_thu'] != null) {
//       hoaChatTieuThu = [];
//       json['hoa_chat_tieu_thu'].forEach((v) {
//         hoaChatTieuThu.add(new HoaChatTieuThu.fromJson(v));
//       });
//     }
//     bieuGiaHoaChat = json['bieu_gia_hoa_chat'] != null
//         ? new BieuGiaHoaChat.fromJson(json['bieu_gia_hoa_chat'])
//         : null;
//     if (json['chi_phi_hoa_chat'] != null) {
//       chiPhiHoaChat = [];
//       json['chi_phi_hoa_chat'].forEach((v) {
//         chiPhiHoaChat.add(new ChiPhiHoaChat.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.congThucPhaHoaChat != null) {
//       data['cong_thuc_pha_hoa_chat'] = this.congThucPhaHoaChat.toJson();
//     }
//     if (this.khoHoaChat != null) {
//       data['kho_hoa_chat'] = this.khoHoaChat.map((v) => v.toJson()).toList();
//     }
//     if (this.hoaChatTieuThu != null) {
//       data['hoa_chat_tieu_thu'] =
//           this.hoaChatTieuThu.map((v) => v.toJson()).toList();
//     }
//     if (this.bieuGiaHoaChat != null) {
//       data['bieu_gia_hoa_chat'] = this.bieuGiaHoaChat.toJson();
//     }
//     if (this.chiPhiHoaChat != null) {
//       data['chi_phi_hoa_chat'] =
//           this.chiPhiHoaChat.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

