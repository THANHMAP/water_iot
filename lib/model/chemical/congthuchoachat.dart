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
  InfoKg infoKg;
  InfoL  infoL;
  InfoS  infoS;

  DataList({this.title, this.infoKg, this.infoL, this.infoS});

  DataList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if(json['info'] != null){
      var jsonResponse = json['info'];
      if(jsonResponse.containsKey("kg")){
        infoKg = json['info'] != null ? new InfoKg.fromJson(json['info']) : null;
      }else if(jsonResponse.containsKey("l")){
        infoL = json['info'] != null ? new InfoL.fromJson(json['info']) : null;
      }else if(jsonResponse.containsKey("s")){
        infoS = json['info'] != null ? new InfoS.fromJson(json['info']) : null;
      }
    }
    // info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.infoKg != null) {
      data['info'] = this.infoKg.toJson();
    }
    return data;
  }
}

class InfoKg {
  int kg;

  InfoKg({this.kg});

  InfoKg.fromJson(Map<String, dynamic> json) {
    if(json['kg'] == null){
      kg = 0;
    }else{
      kg = json['kg'];
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kg'] = this.kg;
    return data;
  }
}

class InfoL {
  int l;


  InfoL({this.l});

  InfoL.fromJson(Map<String, dynamic> json) {
    if(json['l'] == null){
      l = 0;
    }else{
      l = json['l'];
    }
  }

}

class InfoS {
  int s;

  InfoS({this.s});

  InfoS.fromJson(Map<String, dynamic> json) {
    if(json['s'] == null){
      s = 0;
    }else{
      s = json['s'];
    }
  }
}
