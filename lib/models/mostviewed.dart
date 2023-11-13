class MostViewed {
  int? id;
  int? productDetailId;
  ProductDetail? productDetail;
  int? displayCounter;
  Null? userId;

  MostViewed(
      {this.id,
      this.productDetailId,
      this.productDetail,
      this.displayCounter,
      this.userId});

  MostViewed.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productDetailId = json['ProductDetailId'];
    productDetail = json['ProductDetail'] != null
        ? new ProductDetail.fromJson(json['ProductDetail'])
        : null;
    displayCounter = json['DisplayCounter'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ProductDetailId'] = this.productDetailId;
    if (this.productDetail != null) {
      data['ProductDetail'] = this.productDetail!.toJson();
    }
    data['DisplayCounter'] = this.displayCounter;
    data['UserId'] = this.userId;
    return data;
  }
}

class ProductDetail {
  int? id;
  String? productNameInEnglish;
  String? productNameInArabic;
  int? productId;
  Null? product;
  Null? descriptionInArabic;
  Null? descriptionInEnglish;
  Null? sKU;
  Null? oldPrice;
  num? price;
  num? repPercentage;
  Null? barcode;
  Null? barcodeImage;
  int? quantity;
  Null? addedById;
  Null? addedDate;
  Null? updatedById;
  Null? updatedDate;
  bool? isDeleted;
  List<ProductDetailImage>? productDetailImage;

  ProductDetail(
      {this.id,
      this.productNameInEnglish,
      this.productNameInArabic,
      this.productId,
      this.product,
      this.descriptionInArabic,
      this.descriptionInEnglish,
      this.sKU,
      this.oldPrice,
      this.price,
      this.repPercentage,
      this.barcode,
      this.barcodeImage,
      this.quantity,
      this.addedById,
      this.addedDate,
      this.updatedById,
      this.updatedDate,
      this.isDeleted,
      this.productDetailImage});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productNameInEnglish = json['ProductNameInEnglish'];
    productNameInArabic = json['ProductNameInArabic'];
    productId = json['ProductId'];
    product = json['Product'];
    descriptionInArabic = json['DescriptionInArabic'];
    descriptionInEnglish = json['DescriptionInEnglish'];
    sKU = json['SKU'];
    oldPrice = json['OldPrice'];
    price = json['Price'];
    repPercentage = json['RepPercentage'];
    barcode = json['Barcode'];
    barcodeImage = json['BarcodeImage'];
    quantity = json['Quantity'];
    addedById = json['AddedById'];
    addedDate = json['AddedDate'];
    updatedById = json['UpdatedById'];
    updatedDate = json['UpdatedDate'];
    isDeleted = json['IsDeleted'];
    if (json['ProductDetailImage'] != null) {
      productDetailImage = <ProductDetailImage>[];
      json['ProductDetailImage'].forEach((v) {
        productDetailImage!.add(new ProductDetailImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ProductNameInEnglish'] = this.productNameInEnglish;
    data['ProductNameInArabic'] = this.productNameInArabic;
    data['ProductId'] = this.productId;
    data['Product'] = this.product;
    data['DescriptionInArabic'] = this.descriptionInArabic;
    data['DescriptionInEnglish'] = this.descriptionInEnglish;
    data['SKU'] = this.sKU;
    data['OldPrice'] = this.oldPrice;
    data['Price'] = this.price;
    data['RepPercentage'] = this.repPercentage;
    data['Barcode'] = this.barcode;
    data['BarcodeImage'] = this.barcodeImage;
    data['Quantity'] = this.quantity;
    data['AddedById'] = this.addedById;
    data['AddedDate'] = this.addedDate;
    data['UpdatedById'] = this.updatedById;
    data['UpdatedDate'] = this.updatedDate;
    data['IsDeleted'] = this.isDeleted;
    if (this.productDetailImage != null) {
      data['ProductDetailImage'] =
          this.productDetailImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDetailImage {
  int? id;
  String? image;
  int? productDetailId;
  Null? productDetail;

  ProductDetailImage(
      {this.id, this.image, this.productDetailId, this.productDetail});

  ProductDetailImage.fromJson(Map<String, dynamic> json) {
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
