import 'package:flutter/material.dart';
import 'package:ecom_mobile_flutter/pages/product_list_page.dart';
import 'package:ecom_mobile_flutter/pages/login_page.dart';
import 'package:ecom_mobile_flutter/pages/user_detail_page.dart';
import 'package:ecom_mobile_flutter/routes.dart';

void main() => runApp(MaterialApp(
      // home: ProductListPage(),
      // home: LoginPage(),
      home: UserDetailPage(),
      routes: Routes.routesBuilder,
    ));
