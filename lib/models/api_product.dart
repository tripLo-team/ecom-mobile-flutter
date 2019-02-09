import 'package:ecom_mobile_flutter/models/product.dart';

class ApiProduct {
  List<Product> products;
  ApiProduct({this.products});

  // ApiProduct.fromJson(Map<String, dynamic> parsedJson)
  //     : products = parsedJson['products']?.cast<Product>();

  factory ApiProduct.fromJson(Map<String, dynamic> parsedJson) {
    var products = parsedJson['products'] as List;
    return new ApiProduct(
      products: products.map((model) => Product.fromJson(model)).toList(),
    );
  }

  List<Product> get productsList => products;
}
