class AnyImage {
  String imageId;
  String path;
  String productId;
  String imageLabel;

  AnyImage({this.imageId, this.path, this.productId, this.imageLabel});

  factory AnyImage.fromJson(Map<String, dynamic> parsedJson) {
    return new AnyImage(
        imageId: parsedJson['image_id'],
        path: parsedJson['path'],
        productId: parsedJson['produc_iId'],
        imageLabel: parsedJson['image_label']);
  }
}
