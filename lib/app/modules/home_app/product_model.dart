class Product {
  bool? success;
  List<Data>? data;

  Product({this.success, this.data});

  Product.fromJson(Map<String, dynamic> json) {
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
  String? product;
  String? icon;
  int? idCategoryProduct;
  String? regulations;

  Data({this.id, this.product, this.icon, this.idCategoryProduct,this.regulations});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    icon = json['icon'];
    regulations = json['persyaratan'];
    idCategoryProduct = json['id_category_product'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product'] = product;
    data['icon'] = icon;
    data['persyaratan'] = regulations;
    data['id_category_product'] = idCategoryProduct;
    return data;
  }
}
