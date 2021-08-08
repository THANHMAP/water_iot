class ThongSoDien {
  String title;
  List<DataList> dataList;

  ThongSoDien({this.title, this.dataList});

  ThongSoDien.fromJson(Map<String, dynamic> json) {
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
  String v1V2;
  String v1N;
  String v2V3;
  String v2N;
  String v3V1;
  String v3N;
  String vN;
  String a1;
  String a2;
  String a3;
  String an;
  String hz;
  String cosp;
  String kwh;
  String kvarh;
  String kvah;
  String thd;
  String kwhDay;
  String kvarhDay;
  String kwhMonth;
  String kvarhMonth;
  String kwhYear;
  String kvarhYear;
  String kwhTotal;
  String kvarhTotal;

  Info(
      {this.v1V2,
      this.v1N,
      this.v2V3,
      this.v2N,
      this.v3V1,
      this.v3N,
      this.vN,
      this.a1,
      this.a2,
      this.a3,
      this.an,
      this.hz,
      this.cosp,
      this.kwh,
      this.kvarh,
      this.kvah,
      this.thd,
      this.kwhDay,
      this.kvarhDay,
      this.kwhMonth,
      this.kvarhMonth,
      this.kwhYear,
      this.kvarhYear,
      this.kwhTotal,
      this.kvarhTotal});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['v1-v2'] != null) {
      v1V2 = json['v1-v2'].toString();
    }

    if (json['v1-n'] != null) {
      v1N = json['v1-n'].toString();
    }

    if (json['v2-v3'] != null) {
      v2V3 = json['v2-v3'].toString();
    }

    if (json['v2-n'] != null) {
      v2N = json['v2-n'].toString();
    }

    if (json['v3-v1'] != null) {
      v3V1 = json['v3-v1'].toString();
    }

    if (json['v3-n'] != null) {
      v3N = json['v3-n'].toString();
    }

    if (json['v-n'] != null) {
      vN = json['v-n'].toString();
    }

    if (json['a1'] != null) {
      a1 = json['a1'].toString();
    }

    if (json['a2'] != null) {
      a2 = json['a2'].toString();
    }

    if (json['a3'] != null) {
      a3 = json['a3'].toString();
    }

    if (json['an'] != null) {
      an = json['an'].toString();
    }

    if (json['hz'] != null) {
      hz = json['hz'].toString();
    }

    if (json['cosp'] != null) {
      cosp = json['cosp'].toString();
    }

    if (json['kwh'] != null) {
      kwh = json['kwh'].toString();
    }

    if (json['kvarh'] != null) {
      kvarh = json['kvarh'].toString();
    }

    if (json['kvah'] != null) {
      kvah = json['kvah'].toString();
    }

    if (json['thd'] != null) {
      thd = json['thd'].toString();
    }

    if (json['kwh-day'] != null) {
      kwhDay = json['kwh-day'].toString();
    }

    if (json['kvarh-day'] != null) {
      kvarhDay = json['kvarh-day'].toString();
    }

    if (json['kwh-month'] != null) {
      kwhMonth = json['kwh-month'].toString();
    }

    if (json['kvarh-month'] != null) {
      kvarhMonth = json['kvarh-month'].toString();
    }

    if (json['kwh-year'] != null) {
      kwhYear = json['kwh-year'].toString();
    }

    if (json['kvarh-year'] != null) {
      kvarhYear = json['kvarh-year'].toString();
    }

    if (json['kwh-total'] != null) {
      kwhTotal = json['kwh-total'].toString();
    }

    if (json['kvarh-total'] != null) {
      kvarhTotal = json['kvarh-total'].toString();
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['v1-v2'] = this.v1V2;
    data['v1-n'] = this.v1N;
    data['v2-v3'] = this.v2V3;
    data['v2-n'] = this.v2N;
    data['v3-v1'] = this.v3V1;
    data['v3-n'] = this.v3N;
    data['v-n'] = this.vN;
    data['a1'] = this.a1;
    data['a2'] = this.a2;
    data['a3'] = this.a3;
    data['an'] = this.an;
    data['hz'] = this.hz;
    data['cosp'] = this.cosp;
    data['kwh'] = this.kwh;
    data['kvarh'] = this.kvarh;
    data['kvah'] = this.kvah;
    data['thd'] = this.thd;
    data['kwh-day'] = this.kwhDay;
    data['kvarh-day'] = this.kvarhDay;
    data['kwh-month'] = this.kwhMonth;
    data['kvarh-month'] = this.kvarhMonth;
    data['kwh-year'] = this.kwhYear;
    data['kvarh-year'] = this.kvarhYear;
    data['kwh-total'] = this.kwhTotal;
    data['kvarh-total'] = this.kvarhTotal;
    return data;
  }
}
