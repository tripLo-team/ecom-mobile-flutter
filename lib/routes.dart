import 'package:flutter/material.dart';
import 'package:ecom_mobile_flutter/pages/product_list_page.dart';

class Routes {
  static final routesBuilder = <String, WidgetBuilder>{
    ROUTE_PRODUCT_DETAIL: (BuildContext context) => ProductListPage()
  };

  static const String ROUTE_PRODUCT_LIST = "/productList";
  static const String ROUTE_PRODUCT_DETAIL = "/productDetail";
}
