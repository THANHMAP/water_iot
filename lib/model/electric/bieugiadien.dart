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
  int thapDiem;
  int binhThuong;
  int caoDiem;

  Info({this.thapDiem, this.binhThuong, this.caoDiem});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['thap_diem'] != null) {
      thapDiem = json['thap_diem'];
    } else {
      thapDiem = 0;
    }

    if (json['binh_thuong'] != null) {
      binhThuong = json['binh_thuong'];
    } else {
      binhThuong = 0;
    }

    if (json['cao_diem'] != null) {
      caoDiem = json['cao_diem'];
    } else {
      caoDiem = 0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thap_diem'] = this.thapDiem;
    data['binh_thuong'] = this.binhThuong;
    data['cao_diem'] = this.caoDiem;
    return data;
  }
}
