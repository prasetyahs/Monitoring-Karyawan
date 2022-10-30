class Dashboard {
  Dashboard({
    required this.success,
    required this.data,
  });
  Dashboard.fromDashboard();

  late final bool success;
  late final Data data;

  Dashboard.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.alreadyContact,
    required this.alreadyContactPercent,
    required this.notContact,
    required this.notContactPercent,
    required this.pointOfSales,
    required this.insentif,
    required this.followUp,
    required this.followUpPercent,
    required this.interested,
    required this.interestedPercent,
    required this.refuse,
    required this.refusePercent,
  });
  late final int alreadyContact;
  late final String alreadyContactPercent;
  late final int notContact;
  late final notContactPercent;
  late final pointOfSales;
  late final insentif;
  late final followUp;
  late final String followUpPercent;
  late final interested;
  late final String interestedPercent;
  late final refuse;
  late final String refusePercent;

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
    final _data = <String, dynamic>{};
    _data['already_contact'] = alreadyContact;
    _data['already_contact_percent'] = alreadyContactPercent;
    _data['not_contact'] = notContact;
    _data['not_contact_percent'] = notContactPercent;
    _data['point_of_sales'] = pointOfSales;
    _data['insentif'] = insentif;
    _data['follow_up'] = followUp;
    _data['follow_up_percent'] = followUpPercent;
    _data['interested'] = interested;
    _data['interested_percent'] = interestedPercent;
    _data['refuse'] = refuse;
    _data['refuse_percent'] = refusePercent;
    return _data;
  }
}
