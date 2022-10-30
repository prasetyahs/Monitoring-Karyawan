class User {
  String? id;
  String? nip;
  String? nik;
  String? namaKaryawan;
  String? telepon;
  String? email;
  String? password;
  String? image;
  String? tglLahir;
  String? idJabatan;
  String? role;
  Null? rememberToken;
  Null? createdAt;
  Null? updatedAt;
  String? jabatan;

  User(
      {this.id,
      this.nip,
      this.nik,
      this.namaKaryawan,
      this.telepon,
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nip = json['nip'];
    nik = json['nik'];
    namaKaryawan = json['nama_karyawan'];
    telepon = json['telepon'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nip'] = this.nip;
    data['nik'] = this.nik;
    data['nama_karyawan'] = this.namaKaryawan;
    data['telepon'] = this.telepon;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    data['tgl_lahir'] = this.tglLahir;
    data['id_jabatan'] = this.idJabatan;
    data['role'] = this.role;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['jabatan'] = this.jabatan;
    return data;
  }
}