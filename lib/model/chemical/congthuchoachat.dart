class CongThucHoaChat {
  String title;
  List<DataList> dataList;

  CongThucHoaChat({this.title, this.dataList});

  CongThucHoaChat.fromJson(Map<String, dynamic> json) {
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
  int kg;
  int l;
  int s;

  Info({this.kg, this.l, this.s});

  Info.fromJson(Map<String, dynamic> json) {
    if(json['kg'] == null){
      kg = 0;
    }else{
      kg = json['kg'];
    }

    if(json['l'] == null){
      l = 0;
    }else{
      l = json['l'];
    }

    if(json['s'] == null){
      s = 0;
    }else{
      s = json['s'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kg'] = this.kg;
    data['l'] = this.l;
    data['s'] = this.s;
    return data;
  }
}
