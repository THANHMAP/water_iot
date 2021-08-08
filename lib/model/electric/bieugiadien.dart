class BieuGiaDien {
  String title;
  List<DataList> dataList;

  BieuGiaDien({this.title, this.dataList});

  BieuGiaDien.fromJson(Map<String, dynamic> json) {
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
  String thapDiem;
  String binhThuong;
  String caoDiem;

  Info({this.thapDiem, this.binhThuong, this.caoDiem});

  Info.fromJson(Map<String, dynamic> json) {
    thapDiem = json['thap_diem'].toString();
    binhThuong = json['binh_thuong'].toString();
    caoDiem = json['cao_diem'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thap_diem'] = this.thapDiem;
    data['binh_thuong'] = this.binhThuong;
    data['cao_diem'] = this.caoDiem;
    return data;
  }
}
