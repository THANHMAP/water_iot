class ChiPhiHoaChat {
  String title;
  String unit;
  List<DataList> dataList;

  ChiPhiHoaChat({this.title, this.unit, this.dataList});

  ChiPhiHoaChat.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    unit = json['unit'];
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
  int value;

  Info({this.value});

  Info.fromJson(Map<String, dynamic> json) {
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
