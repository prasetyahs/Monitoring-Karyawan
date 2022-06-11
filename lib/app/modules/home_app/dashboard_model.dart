class Dashboard {
  bool? success;
  Data? data;

  Dashboard({this.success, this.data});

  Dashboard.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['data'] = data.map((key, value) => value.toJson().toList());
    return data;
  }
}

class Data {
  int? alreadyContact;
  String? alreadyContactPercent;
  int? notContact;
  int? notContactPercent;
  int? pointOfSales;
  int? insentif;
  int? followUp;
  String? followUpPercent;
  int? interested;
  String? interestedPercent;
  int? refuse;
  String? refusePercent;

  Data(
      {this.alreadyContact,
      this.alreadyContactPercent,
      this.notContact,
      this.notContactPercent,
      this.pointOfSales,
      this.insentif,
      this.followUp,
      this.followUpPercent,
      this.interested,
      this.interestedPercent,
      this.refuse,
      this.refusePercent});

  Data.fromJson(Map<String, dynamic> json) {
    alreadyContact = json['already_contact'];
    alreadyContactPercent = json['already_contact_percent'];
    notContact = json['not_contact'];
    notContactPercent = json['not_contact_percent'];
    pointOfSales = json['point_of_sales'];
    insentif = json['insentif'];
    followUp = json['follow_up'];
    followUpPercent = json['follow_up_percent'];
    interested = json['interested'];
    interestedPercent = json['interested_percent'];
    refuse = json['refuse'];
    refusePercent = json['refuse_percent'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['already_contact'] = alreadyContact;
    data['already_contact_percent'] = alreadyContactPercent;
    data['not_contact'] = notContact;
    data['not_contact_percent'] = notContactPercent;
    data['point_of_sales'] = pointOfSales;
    data['insentif'] = insentif;
    data['follow_up'] = followUp;
    data['follow_up_percent'] = followUpPercent;
    data['interested'] = interested;
    data['interested_percent'] = interestedPercent;
    data['refuse'] = refuse;
    data['refuse_percent'] = refusePercent;
    return data;
  }
}
