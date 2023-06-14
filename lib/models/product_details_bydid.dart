class ProductDetailsByproductdetailsid {
  final int id;
  final int productId;
  final dynamic product;
  final String productName;
  final num oldPrice;
  final num price;
  final int quantity;
  final String companyName;
  final String categoryName;
  final List<ProductDetailImage> productDetailImages;

  ProductDetailsByproductdetailsid({
    required this.id,
    required this.productId,
    required this.product,
    required this.productName,
    required this.oldPrice,
    required this.price,
    required this.quantity,
    required this.companyName,
    required this.categoryName,
    required this.productDetailImages,
  });

  factory ProductDetailsByproductdetailsid.fromJson(Map<String, dynamic> json) {
    var productDetailImagesFromJson =
        json['ProductDetailImages'] as List<dynamic>;

    return ProductDetailsByproductdetailsid(
      id: json['Id'],
      productId: json['ProductId'],
      product: json['Product'],
      productName: json['ProductName'],
      oldPrice: json['OldPrice'],
      price: json['Price'],
      quantity: json['Quantity'],
      companyName: json['CompanyName'],
      categoryName: json['CategoryName'],
      productDetailImages: productDetailImagesFromJson
          .map((e) => ProductDetailImage.fromJson(e))
          .toList(),
    );
  }
}

class ProductDetailImage {
  final int id;
  final String? image;
  final int productDetailId;
  final String? productDetail;

  ProductDetailImage({
    required this.id,
    required this.image,
    required this.productDetailId,
    required this.productDetail,
  });

  factory ProductDetailImage.fromJson(Map<String, dynamic> json) {
    return ProductDetailImage(
      id: json['Id'],
      image: json['Image'],
      productDetailId: json['ProductDetailId'],
      productDetail: json['ProductDetail'],
    );
  }
}
