class CartModel {
  int? id;
  int? productDetailId;
  ProductDetail? productDetail;
  int? quantity;

  CartModel({this.id, this.productDetailId, this.productDetail, this.quantity});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productDetailId = json['ProductDetailId'];
    productDetail = json['ProductDetail'] != null
        ? ProductDetail.fromJson(json['ProductDetail'])
        : null;
    quantity = json['Quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['ProductDetailId'] = productDetailId;
    if (productDetail != null) {
      data['ProductDetail'] = productDetail!.toJson();
    }
    data['Quantity'] = quantity;
    return data;
  }
}

class ProductDetail {
  int? id;
  String? productNameInEnglish;
  String? productNameInArabic;
  int? productId;
  Null? product;
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
    data['Id'] = id;
    data['ProductNameInEnglish'] = productNameInEnglish;
    data['ProductNameInArabic'] = productNameInArabic;
    data['ProductId'] = productId;
    data['Product'] = product;
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
  Null productDetail;

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