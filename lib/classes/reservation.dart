class Res {
  List<Data>? data;

  Res({this.data});

  Res.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Attributes? attributes;

  Data({this.id, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? coach;
  String? startTime;
  String? endTime;
  String? activity;

  Attributes({this.coach, this.startTime, this.endTime, this.activity});

  Attributes.fromJson(Map<String, dynamic> json) {
    coach = json['Coach'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    activity = json['activity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Coach'] = this.coach;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['activity'] = this.activity;
    return data;
  }
}
