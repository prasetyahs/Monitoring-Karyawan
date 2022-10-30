class Jabatan {
  int? id;
  String? jabatan;
  String? singkatan;

  Jabatan({this.id, this.jabatan, this.singkatan});

  Jabatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jabatan = json['jabatan'];
    singkatan = json['singkatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jabatan'] = this.jabatan;
    data['singkatan'] = this.singkatan;
    return data;
  }
}
