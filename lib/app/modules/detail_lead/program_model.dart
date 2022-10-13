class ProgramModel {
  bool? success;
  List<Data>? data;

  ProgramModel({this.success, this.data});
  ProgramModel.fromProgramModel();
  ProgramModel.fromJson(Map<String, dynamic> json) {
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
  String? program;
  String? idProduct;
  String? product;
  String? category;

  Data({this.id, this.program, this.idProduct, this.product, this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    program = json['program'];
    idProduct = json['id_product'];
    product = json['product'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['program'] = this.program;
    data['id_product'] = this.idProduct;
    data['product'] = this.product;
    data['category'] = this.category;
    return data;
  }
}
