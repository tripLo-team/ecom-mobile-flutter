import 'package:ecom_mobile_flutter/models/any_image.dart';

class Product {
  int productId;
  String productName;
  String productDescription;
  double unitPrice;
  int supplierId;
  int category;
  int unitsInStrock;
  int unitsOnOrder;
  List<AnyImage> images;

  Product(
      {this.productId,
      this.productName,
      this.productDescription,
      this.unitPrice,
      this.supplierId,
      this.category,
      this.unitsInStrock,
      this.unitsOnOrder});
}
