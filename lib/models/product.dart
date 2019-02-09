import 'package:ecom_mobile_flutter/models/any_image.dart';

class Product {
  String productId;
  String productName;
  String productDescription;
  double unitPrice;
  String supplierId;
  String category;
  int unitsInStock;
  int unitsOnOrder;
  List<AnyImage> images;

  Product(
      {this.productId,
      this.productName,
      this.productDescription,
      this.unitPrice,
      this.supplierId,
      this.category,
      this.unitsInStock,
      this.unitsOnOrder,
      this.images});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    var images = parsedJson['images'] as List;
    return new Product(
        productId: parsedJson['product_id'],
        productName: parsedJson['product_name'],
        productDescription: parsedJson['product_description'],
        unitPrice: double.parse(parsedJson['unit_price']),
        supplierId: parsedJson['supplier_id'],
        category: parsedJson['category'],
        unitsInStock: int.parse(parsedJson['units_in_stock']),
        unitsOnOrder: int.parse(parsedJson['units_on_order']),
        images: images.map((model) => AnyImage.fromJson(model)).toList());
  }
}
