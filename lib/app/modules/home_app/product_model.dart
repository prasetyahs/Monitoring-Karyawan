class Product {
  Product({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;

  Product.fromProduct();
  Product.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.product,
    required this.icon,
    required this.persyaratan,
    required this.idCategoryProduct,
  });
  late final int id;
  late final String product;
  late final String icon;
  late final String persyaratan;
  late final String idCategoryProduct;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    icon = json['icon'];
    persyaratan = json['persyaratan'];
    idCategoryProduct = json['id_category_product'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product'] = product;
    _data['icon'] = icon;
    _data['persyaratan'] = persyaratan;
    _data['id_category_product'] = idCategoryProduct;
    return _data;
  }
}
