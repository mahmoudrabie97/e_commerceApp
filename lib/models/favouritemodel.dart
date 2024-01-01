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
    data['Id'] = id;
    data['ProductDetailId'] = productDetailId;
    if (productDetail != null) {
      data['ProductDetail'] = productDetail!.toJson();
    }
    data['UserId'] = userId;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    data['Date'] = date;
    return data;
  }
}

class ProductDetail {
  int? id;
  String? productNameInEnglish;
  String? productNameInArabic;
  int? productId;
  dynamic product;
  String? descriptionInArabic;
  String? descriptionInEnglish;
  dynamic sKU;
  dynamic oldPrice;
  num? price;
  num? repPercentage;
  dynamic barcode;
  dynamic barcodeImage;
  num? quantity;
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

class User {
  String? id;
  String? name;
  dynamic phone;
  dynamic companyId;
  dynamic company;
  dynamic jobTitleId;
  dynamic jobTitle;
  dynamic groupId;
  dynamic group;
  bool? isActive;
  dynamic addedDate;
  dynamic updatedDate;
  String? email;
  dynamic address;
  dynamic roles;
  dynamic userRoles;
  dynamic rolesIds;
  dynamic phoneNumber;
  dynamic password;

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
    data['Id'] = id;
    data['Name'] = name;
    data['Phone'] = phone;
    data['CompanyId'] = companyId;
    data['Company'] = company;
    data['JobTitleId'] = jobTitleId;
    data['JobTitle'] = jobTitle;
    data['GroupId'] = groupId;
    data['Group'] = group;
    data['IsActive'] = isActive;
    data['AddedDate'] = addedDate;
    data['UpdatedDate'] = updatedDate;
    data['Email'] = email;
    data['Address'] = address;
    data['Roles'] = roles;
    data['userRoles'] = userRoles;
    data['RolesIds'] = rolesIds;
    data['PhoneNumber'] = phoneNumber;
    data['Password'] = password;
    return data;
  }
}
