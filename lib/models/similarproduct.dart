class SimilarPModel {
  int? id;
  int? productId;
  dynamic product;
  String? productName;
  num? oldPrice;
  num? price;
  num? repPercentage;
  int? quantity;
  String? companyName;
  int? categoryId;
  String? categoryName;
  dynamic description;
  List<ProductDetailImages>? productDetailImages;
  dynamic detailBanner;
  dynamic mainImage;
  num? rate;

  SimilarPModel(
      {this.id,
      this.productId,
      this.product,
      this.productName,
      this.oldPrice,
      this.price,
      this.repPercentage,
      this.quantity,
      this.companyName,
      this.categoryId,
      this.categoryName,
      this.description,
      this.productDetailImages,
      this.detailBanner,
      this.mainImage,
      this.rate});

  SimilarPModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productId = json['ProductId'];
    product = json['Product'];
    productName = json['ProductName'];
    oldPrice = json['OldPrice'];
    price = json['Price'];
    repPercentage = json['RepPercentage'];
    quantity = json['Quantity'];
    companyName = json['CompanyName'];
    categoryId = json['CategoryId'];
    categoryName = json['CategoryName'];
    description = json['Description'];
    if (json['ProductDetailImages'] != null) {
      productDetailImages = <ProductDetailImages>[];
      json['ProductDetailImages'].forEach((v) {
        productDetailImages!.add(ProductDetailImages.fromJson(v));
      });
    }
    detailBanner = json['DetailBanner'];
    mainImage = json['MainImage'];
    rate = json['Rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['ProductId'] = productId;
    data['Product'] = product;
    data['ProductName'] = productName;
    data['OldPrice'] = oldPrice;
    data['Price'] = price;
    data['RepPercentage'] = repPercentage;
    data['Quantity'] = quantity;
    data['CompanyName'] = companyName;
    data['CategoryId'] = categoryId;
    data['CategoryName'] = categoryName;
    data['Description'] = description;
    if (productDetailImages != null) {
      data['ProductDetailImages'] =
          productDetailImages!.map((v) => v.toJson()).toList();
    }
    data['DetailBanner'] = detailBanner;
    data['MainImage'] = mainImage;
    data['Rate'] = rate;
    return data;
  }
}

class ProductDetailImages {
  int? id;
  String? image;
  int? productDetailId;
  dynamic productDetail;

  ProductDetailImages(
      {this.id, this.image, this.productDetailId, this.productDetail});

  ProductDetailImages.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    image = json['Image'];
    productDetailId = json['ProductDetailId'];
    productDetail = json['ProductDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = id;
    data['Image'] = image;
    data['ProductDetailId'] = productDetailId;
    data['ProductDetail'] = productDetail;
    return data;
  }
}
