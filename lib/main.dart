import 'package:flutter/material.dart';
import 'package:ecom_mobile_flutter/pages/product_list_page.dart';
import 'package:ecom_mobile_flutter/routes.dart';

void main() => runApp(MaterialApp(
      home: ProductListPage(),
      routes: Routes.routesBuilder,
    ));
