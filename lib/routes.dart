import 'package:flutter/material.dart';
import 'package:ecom_mobile_flutter/pages/product_list_page.dart';
import 'package:ecom_mobile_flutter/pages/product_detail_page.dart';
import 'package:ecom_mobile_flutter/pages/login_page.dart';
import 'package:ecom_mobile_flutter/pages/register_page.dart';
import 'package:ecom_mobile_flutter/pages/user_detail_page.dart';
import 'package:ecom_mobile_flutter/pages/cart_page.dart';
import 'package:ecom_mobile_flutter/pages/order_history_page.dart';

class Routes {
  static final routesBuilder = <String, WidgetBuilder>{
    ROUTE_PRODUCT_LIST: (BuildContext context) => ProductListPage(),
    ROUTE_PRODUCT_DETAIL: (BuildContext context) => ProductDetailPage(),
    ROUTE_LOGIN: (BuildContext context) => LoginPage(),
    ROUTE_REGISTER: (BuildContext context) => RegisterPage(),
    ROUTE_USER_DETAIL: (BuildContext context) => UserDetailPage(),
    ROUTE_CART: (BuildContext context) => CartPage(),
    ROUTE_ORDER_HISTORY: (BuildContext context) => OrderHistoryPage(),
  };

  static const String ROUTE_PRODUCT_LIST = "/product-list";
  static const String ROUTE_PRODUCT_DETAIL = "/product-detail";
  static const String ROUTE_LOGIN = "/login";
  static const String ROUTE_REGISTER = "/register";
  static const String ROUTE_USER_DETAIL = "/user-detail";
  static const String ROUTE_CART = "/cart";
  static const String ROUTE_ORDER_HISTORY = "/order-history";
}
