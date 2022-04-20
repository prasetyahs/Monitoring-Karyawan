class LoginModel {
  bool? success;
  String? message;
  Data? data;

  LoginModel({this.success, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nip;
  String? nik;
  String? namaKaryawan;
  String? email;
  String? password;
  String? image;
  String? tglLahir;
  int? idJabatan;
  int? role;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? jabatan;

  Data(
      {this.id,
      this.nip,
      this.nik,
      this.namaKaryawan,
      this.email,
      this.password,
      this.image,
      this.tglLahir,
      this.idJabatan,
      this.role,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.jabatan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nip = json['nip'];
    nik = json['nik'];
    namaKaryawan = json['nama_karyawan'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    tglLahir = json['tgl_lahir'];
    idJabatan = json['id_jabatan'];
    role = json['role'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jabatan = json['jabatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nip'] = nip;
    data['nik'] = nik;
    data['nama_karyawan'] = namaKaryawan;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['tgl_lahir'] = tglLahir;
    data['id_jabatan'] = idJabatan;
    data['role'] = role;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['jabatan'] = jabatan;
    return data;
  }
}

