class FavouriteModel {
  int? id;
  int? productDetailId;
  ProductDetail? productDetail;
  String? userId;
  User? user;
  String? date;

  FavouriteModel(
      {this.id,
      this.productDetailId,
      this.productDetail,
      this.userId,
      this.user,
      this.date});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productDetailId = json['ProductDetailId'];
    productDetail = json['ProductDetail'] != null
        ? new ProductDetail.fromJson(json['ProductDetail'])
        : null;
    userId = json['UserId'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ProductDetailId'] = this.productDetailId;
    if (this.productDetail != null) {
      data['ProductDetail'] = this.productDetail!.toJson();
    }
    data['UserId'] = this.userId;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    data['Date'] = this.date;
    return data;
  }
}

class ProductDetail {
  int? id;
  String? productNameInEnglish;
  String? productNameInArabic;
  int? productId;
  Null? product;
  String? descriptionInArabic;
  String? descriptionInEnglish;
  Null? sKU;
  Null? oldPrice;
  num? price;
  num? repPercentage;
  Null? barcode;
  Null? barcodeImage;
  num? quantity;
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

class User {
  String? id;
  String? name;
  Null? phone;
  Null? companyId;
  Null? company;
  Null? jobTitleId;
  Null? jobTitle;
  Null? groupId;
  Null? group;
  bool? isActive;
  Null? addedDate;
  Null? updatedDate;
  String? email;
  Null? address;
  Null? roles;
  Null? userRoles;
  Null? rolesIds;
  Null? phoneNumber;
  Null? password;

  User(
      {this.id,
      this.name,
      this.phone,
      this.companyId,
      this.company,
      this.jobTitleId,
      this.jobTitle,
      this.groupId,
      this.group,
      this.isActive,
      this.addedDate,
      this.updatedDate,
      this.email,
      this.address,
      this.roles,
      this.userRoles,
      this.rolesIds,
      this.phoneNumber,
      this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    phone = json['Phone'];
    companyId = json['CompanyId'];
    company = json['Company'];
    jobTitleId = json['JobTitleId'];
    jobTitle = json['JobTitle'];
    groupId = json['GroupId'];
    group = json['Group'];
    isActive = json['IsActive'];
    addedDate = json['AddedDate'];
    updatedDate = json['UpdatedDate'];
    email = json['Email'];
    address = json['Address'];
    roles = json['Roles'];
    userRoles = json['userRoles'];
    rolesIds = json['RolesIds'];
    phoneNumber = json['PhoneNumber'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    data['CompanyId'] = this.companyId;
    data['Company'] = this.company;
    data['JobTitleId'] = this.jobTitleId;
    data['JobTitle'] = this.jobTitle;
    data['GroupId'] = this.groupId;
    data['Group'] = this.group;
    data['IsActive'] = this.isActive;
    data['AddedDate'] = this.addedDate;
    data['UpdatedDate'] = this.updatedDate;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['Roles'] = this.roles;
    data['userRoles'] = this.userRoles;
    data['RolesIds'] = this.rolesIds;
    data['PhoneNumber'] = this.phoneNumber;
    data['Password'] = this.password;
    return data;
  }
}
