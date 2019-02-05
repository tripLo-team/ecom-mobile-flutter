import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:ecom_mobile_flutter/models/product.dart';
import 'package:ecom_mobile_flutter/config.dart';

class ProductsScopedModel extends Model {
  List<Product> _productsList = [];
  bool _isLoading = true;
  bool _hasMoreProducts = true;

  List<Product> get productsList => _productsList;
  bool get isLoading => _isLoading;
  bool get hasMoreProducts => _hasMoreProducts;
  int get productsCount => _productsList.length;

  Future<dynamic> _getProductsAPI({limit = 10, cursor = 0}) async {
    var response = await http.get(
      Config.API_PRODUCTS_URL + "?limit=$limit&cursor=$cursor",
      headers: {
        "Authorization": Config.AuthorizationToken,
      },
    ).catchError(
      (error) {
        return false;
      },
    );

    return json.decode(response.body);
  }

  getProducts() => _getProductsAPI();
}
