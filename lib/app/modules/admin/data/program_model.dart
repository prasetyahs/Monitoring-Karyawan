class Program {
  String? id;
  String? program;
  String? idProduct;
  String? product;
  String? category;

  Program({this.id, this.program, this.idProduct, this.product, this.category});

  Program.fromJson(Map<String, dynamic> json) {
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