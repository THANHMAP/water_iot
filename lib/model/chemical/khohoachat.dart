class KhoHoaChat {
  String title;
  List<DataList> dataList;

  KhoHoaChat({this.title, this.dataList});

  KhoHoaChat.fromJson(Map<String, dynamic> json) {
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
  String unit;
  InfoKhoiLuongConLai infoKLCL;
  InfokhoiLuongDaNhap infoKLDN;
  InfoBieuGia infoBG;

  DataList({this.title,  this.unit, this.infoKLCL, this.infoKLDN, this.infoBG});

  DataList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    unit = json['unit'];
    if(json['info'] != null) {
      var jsonResponse = json['info'];
      if(jsonResponse.containsKey("value")){
        infoBG = json['info'] != null ? new InfoBieuGia.fromJson(json['info']) : null;
      } else if(jsonResponse.containsKey("khoi_luong_con_lai")){
        infoKLCL = json['info'] != null ? new InfoKhoiLuongConLai.fromJson(json['info']) : null;
      }else if(jsonResponse.containsKey("khoi_luong_da_nhap")){
        infoKLDN = json['info'] != null ? new InfokhoiLuongDaNhap.fromJson(json['info']) : null;
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['unit'] = this.unit;
    if (this.infoKLCL != null) {
      data['info'] = this.infoKLCL.toJson();
    }
    return data;
  }
}

class InfoKhoiLuongConLai {
  int khoiLuongConLai;

  InfoKhoiLuongConLai({this.khoiLuongConLai});

  InfoKhoiLuongConLai.fromJson(Map<String, dynamic> json) {
    if(json['khoi_luong_con_lai'] == null){
      khoiLuongConLai = 0;
    }else{
      khoiLuongConLai = json['khoi_luong_con_lai'];
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['khoi_luong_con_lai'] = this.khoiLuongConLai;
    return data;
  }
}

class InfokhoiLuongDaNhap {
  int khoiLuongDaNhap;

  InfokhoiLuongDaNhap({this.khoiLuongDaNhap});

  InfokhoiLuongDaNhap.fromJson(Map<String, dynamic> json) {

    if(json['khoi_luong_da_nhap'] == null){
      khoiLuongDaNhap = 0;
    }else{
      khoiLuongDaNhap = json['khoi_luong_da_nhap'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['khoi_luong_da_nhap'] = this.khoiLuongDaNhap;
    return data;
  }
}

class InfoBieuGia {
  int value;

  InfoBieuGia({this.value});

  InfoBieuGia.fromJson(Map<String, dynamic> json) {
    if(json['value'] == null){
      value = 0;
    }else{
      value = json['value'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}
