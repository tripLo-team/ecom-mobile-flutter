import 'package:ecom_mobile_flutter/models/product.dart';

class ApiProduct {
  List<Product> products;
  ApiProduct({this.products});

  // ApiProduct.fromJson(Map<String, dynamic> parsedJson)
  //     : products = parsedJson['products']?.cast<Product>();

  factory ApiProduct.fromJson(Map<String, dynamic> parsedJson) {
    return new ApiProduct(
      products: parsedJson['products']?.cast<Product>(),
    );
  }

  List<Product> get productsList => products;
}
