import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../product_model.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Product.fromJson(map);
      if (map is List) {
        return map.map((item) => Product.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = dotenv.get("CLIENT_URL");
  }

  Future<Response> allProduct() async {
    return get("product");
  }

  Future<Response<Product>> postProduct(Product product) async =>
      await post('product', product);

  Future<Response> deleteProduct(int id) async => await delete('product/$id');
}
