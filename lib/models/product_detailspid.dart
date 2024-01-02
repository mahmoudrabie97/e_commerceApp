class ProductDetailImages {
  final int id;
  final String image;
  final int productDetailId;
  final dynamic productDetail;

  ProductDetailImages({
    required this.id,
    required this.image,
    required this.productDetailId,
    this.productDetail,
  });

  factory ProductDetailImages.fromJson(Map<String, dynamic> json) {
    return ProductDetailImages(
      id: json['Id'],
      image: json['Image'],
      productDetailId: json['ProductDetailId'],
      productDetail: json['ProductDetail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Image': image,
      'ProductDetailId': productDetailId,
      'ProductDetail': productDetail,
    };
  }
}

class ProductDetailsBypId {
  final int id;
  final int productId;
  final dynamic product;
  final String productName;
  final num oldPrice;
  final num price;
  num quantity;
  final String companyName;
  final String categoryName;
  final List<ProductDetailImages> productDetailImages;

  ProductDetailsBypId({
    required this.id,
    required this.productId,
    this.product,
    required this.productName,
    required this.oldPrice,
    required this.price,
    required this.quantity,
    required this.companyName,
    required this.categoryName,
    required this.productDetailImages,
  });

  factory ProductDetailsBypId.fromJson(Map<String, dynamic> json) {
    List<dynamic>? detailImagesJson = json['ProductDetailImages'];
    List<ProductDetailImages> detailImages = detailImagesJson
            ?.map((json) => ProductDetailImages.fromJson(json))
            .toList() ??
        [];

    return ProductDetailsBypId(
      id: json['Id'],
      productId: json['ProductId'],
      product: json['Product'],
      productName: json['ProductName'],
      oldPrice: json['OldPrice'],
      price: json['Price'],
      quantity: json['Quantity'],
      companyName: json['CompanyName'],
      categoryName: json['CategoryName'],
      productDetailImages: detailImages,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> detailImagesJson =
        productDetailImages.map((image) => image.toJson()).toList();

    return {
      'Id': id,
      'ProductId': productId,
      'Product': product,
      'ProductName': productName,
      'OldPrice': oldPrice,
      'Price': price,
      'Quantity': quantity,
      'CompanyName': companyName,
      'CategoryName': categoryName,
      'ProductDetailImages': detailImagesJson,
    };
  }
}
