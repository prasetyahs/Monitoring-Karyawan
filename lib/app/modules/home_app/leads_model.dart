class Leads {
  bool? success;
  List<Data>? data;

  Leads({this.success, this.data});

  Leads.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['data'] = data.map((key, value) => value.toJson().toList());
    return data;
  }
}

class Data {
  int? id;
  int? idCustomer;
  int? idKaryawan;
  int? isContact;
  String? nik;
  String? namaCustomer;
  String? email;
  String? tglLahir;
  String? jenisKelamin;
  String? noRek;
  String? telepon;

  Data(
      {this.id,
      this.idCustomer,
      this.idKaryawan,
      this.isContact,
      this.nik,
      this.namaCustomer,
      this.email,
      this.tglLahir,
      this.jenisKelamin,
      this.noRek,
      this.telepon});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCustomer = json['id_customer'];
    idKaryawan = json['id_karyawan'];
    isContact = json['is_contact'];
    nik = json['nik'];
    namaCustomer = json['nama_customer'];
    email = json['email'];
    tglLahir = json['tgl_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    noRek = json['no_rek'];
    telepon = json['telepon'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['id_customer'] = idCustomer;
    data['id_karyawan'] = idKaryawan;
    data['is_contact'] = isContact;
    data['nik'] = nik;
    data['nama_customer'] = namaCustomer;
    data['email'] = email;
    data['tgl_lahir'] = tglLahir;
    data['jenis_kelamin'] = jenisKelamin;
    data['no_rek'] = noRek;
    data['telepon'] = telepon;
    return data;
  }
}
