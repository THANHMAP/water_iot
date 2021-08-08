class BieuGiaHoaChat {
  String title;
  List<DataList> dataList;

  BieuGiaHoaChat({this.title, this.dataList});

  BieuGiaHoaChat.fromJson(Map<String, dynamic> json) {
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
  Info info;

  DataList({this.title, this.unit, this.info});

  DataList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    unit = json['unit'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['unit'] = this.unit;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}

class Info {
  int value;

  Info({this.value});

  Info.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}
