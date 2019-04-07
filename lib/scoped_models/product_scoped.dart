import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:ecom_mobile_flutter/models/product.dart';
import 'package:ecom_mobile_flutter/models/api_product.dart';
import 'package:ecom_mobile_flutter/config.dart';

class ProductsScopedModel extends Model {
  List<Product> _productsList = [];
  bool _isLoading = true;
  bool _hasMoreProducts = true;

  ProductsScopedModel();

  List<Product> get productsList => _productsList;
  bool get isLoading => _isLoading;
  bool get hasMoreProducts => _hasMoreProducts;
  int get productsCount => _productsList.length;

  Future _getProductsAPI({limit = 10, cursor = 0}) async {
    _isLoading = true;
    notifyListeners();

    String url = Config.API_PRODUCTS_URL + "?limit=$limit&cursor=$cursor";
    print("_getProductsAPI " + url);
    final response =
        await http.get(url, headers: {"Accept": "application/json"}).catchError(
      (error) {
        return false;
      },
    );

    _productsList =
        new ApiProduct.fromJson(json.decode(response.body)).productsList;
    _hasMoreProducts = false;
    _isLoading = false;
    notifyListeners();
  }

  getProducts() => _getProductsAPI();
}
