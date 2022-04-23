class schedule {
  int? id;
  Attributes? attributes;

  schedule({this.id, this.attributes});

  schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])  : null;
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
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;
  String? day;
  Activity? activity;
  Coaches? coaches;

  Attributes(
      {this.startTime,
      this.endTime,
      this.createdAt,
      this.updatedAt,
      this.day,
      this.activity,
      this.coaches});

  Attributes.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    day = json['day'];
    activity = json['activity'] != null
        ? new Activity.fromJson(json['activity'])
        : null;
    coaches =
        json['coaches'] != null ? new Coaches.fromJson(json['coaches']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['day'] = this.day;
    if (this.activity != null) {
      data['activity'] = this.activity!.toJson();
    }
    if (this.coaches != null) {
      data['coaches'] = this.coaches!.toJson();
    }
    return data;
  }
}

class Activity {
  schedule? data;

  Activity({this.data});

  Activity.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new schedule.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AttAct {
  String? name;
  String? description;
  bool? needsReservation;
  String? createdAt;
  String? updatedAt;

  AttAct(
      {this.name,
      this.description,
      this.needsReservation,
      this.createdAt,
      this.updatedAt});

  AttAct.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    needsReservation = json['needs_reservation'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['needs_reservation'] = this.needsReservation;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Coaches {
  List<Coaches>? data;

  Coaches({this.data});

  Coaches.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Coaches>[];
      json['data'].forEach((v) {
        data!.add(new Coaches.fromJson(v));
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

class Attcoach {
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? firstName;
  String? lastName;
  String? createdAt;
  String? updatedAt;

  Attcoach(
      {this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.firstName,
      this.lastName,
      this.createdAt,
      this.updatedAt});

  Attcoach.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['confirmed'] = this.confirmed;
    data['blocked'] = this.blocked;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
