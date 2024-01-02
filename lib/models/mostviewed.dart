class MostViewed {
  int? id;
  int? productDetailId;
  ProductDetail? productDetail;
  int? displayCounter;
  dynamic userId;

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
        ? ProductDetail.fromJson(json['ProductDetail'])
        : null;
    displayCounter = json['DisplayCounter'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = id;
    data['ProductDetailId'] = productDetailId;
    if (productDetail != null) {
      data['ProductDetail'] = productDetail!.toJson();
    }
    data['DisplayCounter'] = displayCounter;
    data['UserId'] = userId;
    return data;
  }
}

class ProductDetail {
  int? id;
  String? productNameInEnglish;
  String? productNameInArabic;
  int? productId;
  dynamic product;
  dynamic descriptionInArabic;
  dynamic descriptionInEnglish;
  dynamic sKU;
  dynamic oldPrice;
  num? price;
  num? repPercentage;
  dynamic barcode;
  dynamic barcodeImage;
  int? quantity;
  dynamic addedById;
  dynamic addedDate;
  dynamic updatedById;
  dynamic updatedDate;
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
        productDetailImage!.add(ProductDetailImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = id;
    data['ProductNameInEnglish'] = productNameInEnglish;
    data['ProductNameInArabic'] = productNameInArabic;
    data['ProductId'] = productId;
    data['Product'] = product;
    data['DescriptionInArabic'] = descriptionInArabic;
    data['DescriptionInEnglish'] = descriptionInEnglish;
    data['SKU'] = sKU;
    data['OldPrice'] = oldPrice;
    data['Price'] = price;
    data['RepPercentage'] = repPercentage;
    data['Barcode'] = barcode;
    data['BarcodeImage'] = barcodeImage;
    data['Quantity'] = quantity;
    data['AddedById'] = addedById;
    data['AddedDate'] = addedDate;
    data['UpdatedById'] = updatedById;
    data['UpdatedDate'] = updatedDate;
    data['IsDeleted'] = isDeleted;
    if (productDetailImage != null) {
      data['ProductDetailImage'] =
          productDetailImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDetailImage {
  int? id;
  String? image;
  int? productDetailId;
  dynamic productDetail;

  ProductDetailImage(
      {this.id, this.image, this.productDetailId, this.productDetail});

  ProductDetailImage.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    image = json['Image'];
    productDetailId = json['ProductDetailId'];
    productDetail = json['ProductDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Image'] = image;
    data['ProductDetailId'] = productDetailId;
    data['ProductDetail'] = productDetail;
    return data;
  }
}
