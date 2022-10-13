class LeadsProduct {
  bool? success;
  List<Data>? data;

  LeadsProduct({this.success, this.data});
 LeadsProduct.fromLeadsProduct();
  LeadsProduct.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? idLeads;
  String? idProgram;
  String? status;
  String? date;
  String? alasan;
  String? program;
  String? idProduct;
  String? product;
  String? icon;
  String? persyaratan;

  Data(
      {this.id,
      this.idLeads,
      this.idProgram,
      this.status,
      this.date,
      this.alasan,
      this.program,
      this.idProduct,
      this.product,
      this.icon,
      this.persyaratan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLeads = json['id_leads'];
    idProgram = json['id_program'];
    status = json['status'];
    date = json['date'];
    alasan = json['alasan'];
    program = json['program'];
    idProduct = json['id_product'];
    product = json['product'];
    icon = json['icon'];
    persyaratan = json['persyaratan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_leads'] = this.idLeads;
    data['id_program'] = this.idProgram;
    data['status'] = this.status;
    data['date'] = this.date;
    data['alasan'] = this.alasan;
    data['program'] = this.program;
    data['id_product'] = this.idProduct;
    data['product'] = this.product;
    data['icon'] = this.icon;
    data['persyaratan'] = this.persyaratan;
    return data;
  }
}
 