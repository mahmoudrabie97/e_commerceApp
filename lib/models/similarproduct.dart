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
        productDetailImages!.add(new ProductDetailImages.fromJson(v));
      });
    }
    detailBanner = json['DetailBanner'];
    mainImage = json['MainImage'];
    rate = json['Rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ProductId'] = this.productId;
    data['Product'] = this.product;
    data['ProductName'] = this.productName;
    data['OldPrice'] = this.oldPrice;
    data['Price'] = this.price;
    data['RepPercentage'] = this.repPercentage;
    data['Quantity'] = this.quantity;
    data['CompanyName'] = this.companyName;
    data['CategoryId'] = this.categoryId;
    data['CategoryName'] = this.categoryName;
    data['Description'] = this.description;
    if (this.productDetailImages != null) {
      data['ProductDetailImages'] =
          this.productDetailImages!.map((v) => v.toJson()).toList();
    }
    data['DetailBanner'] = this.detailBanner;
    data['MainImage'] = this.mainImage;
    data['Rate'] = this.rate;
    return data;
  }
}

class ProductDetailImages {
  int? id;
  String? image;
  int? productDetailId;
  Null? productDetail;

  ProductDetailImages(
      {this.id, this.image, this.productDetailId, this.productDetail});

  ProductDetailImages.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    image = json['Image'];
    productDetailId = json['ProductDetailId'];
    productDetail = json['ProductDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Image'] = this.image;
    data['ProductDetailId'] = this.productDetailId;
    data['ProductDetail'] = this.productDetail;
    return data;
  }
}
