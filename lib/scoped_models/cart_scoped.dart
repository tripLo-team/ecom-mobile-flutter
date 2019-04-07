import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:ecom_mobile_flutter/models/product.dart';
import 'package:ecom_mobile_flutter/models/api_product.dart';
import 'package:ecom_mobile_flutter/config.dart';

class CartScopedModel extends Model {
  List<Product> _cartItemList = [];
  bool _isLoading = true;
  bool _hasMoreItems = true;

  CartScopedModel();

  List<Product> get cartItemList => _cartItemList;
  bool get isLoading => _isLoading;
  bool get hasMoreItems => _hasMoreItems;
  int get productsCount => _cartItemList.length;

  Future _getProductsAPI({limit = 10, cursor = 0}) async {
    _isLoading = true;
    notifyListeners();
    print("_getProductsAPI " +
        Config.API_PRODUCTS_URL +
        "?limit=$limit&cursor=$cursor");
    final response =
        await http.get(Config.API_PRODUCTS_URL + "?limit=$limit&cursor=$cursor",
            // "https://jsonplaceholder.typicode.com/posts",
            headers: {"Accept": "application/json"}).catchError(
      (error) {
        return false;
      },
    );

    _cartItemList =
        new ApiProduct.fromJson(json.decode(response.body)).productsList;
    _hasMoreItems = false;
    _isLoading = false;
    notifyListeners();
  }

  getProducts() => _getProductsAPI();
}
