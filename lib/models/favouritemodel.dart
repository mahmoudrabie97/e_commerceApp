class FavouriteModel {
  int? id;
  int? productId;
  Product? product;
  String? userId;
  User? user;
  String? date;

  FavouriteModel(
      {this.id,
      this.productId,
      this.product,
      this.userId,
      this.user,
      this.date});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productId = json['ProductId'];
    product =
        json['Product'] != null ? Product.fromJson(json['Product']) : null;
    userId = json['UserId'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['ProductId'] = productId;
    if (product != null) {
      data['Product'] = product!.toJson();
    }
    data['UserId'] = userId;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    data['Date'] = date;
    return data;
  }
}

class Product {
  int? id;
  String? nameInArabic;
  String? nameInEnglish;
  String? descriptionInArabic;
  String? descriptionInEnglish;
  int? categoryId;
  Null? category;
  num? brandId;
  Null? brand;
  Null? companyId;
  Null? company;
  bool? isReturnAllowed;
  Null? barcode;
  bool? autoBarcode;
  String? mainImage;
  num? oldPrice;
  num? price;
  Null? productTaxes;
  Null? addedById;
  Null? addedDate;
  Null? updatedById;
  Null? updatedDate;
  bool? isDeleted;
  bool? showInHomeProductsSection;
  bool? showInBestSellingSection;
  bool? showInFeaturedProductsSection;

  Product(
      {this.id,
      this.nameInArabic,
      this.nameInEnglish,
      this.descriptionInArabic,
      this.descriptionInEnglish,
      this.categoryId,
      this.category,
      this.brandId,
      this.brand,
      this.companyId,
      this.company,
      this.isReturnAllowed,
      this.barcode,
      this.autoBarcode,
      this.mainImage,
      this.oldPrice,
      this.price,
      this.productTaxes,
      this.addedById,
      this.addedDate,
      this.updatedById,
      this.updatedDate,
      this.isDeleted,
      this.showInHomeProductsSection,
      this.showInBestSellingSection,
      this.showInFeaturedProductsSection});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nameInArabic = json['NameInArabic'];
    nameInEnglish = json['NameInEnglish'];
    descriptionInArabic = json['DescriptionInArabic'];
    descriptionInEnglish = json['DescriptionInEnglish'];
    categoryId = json['CategoryId'];
    category = json['Category'];
    brandId = json['BrandId'];
    brand = json['Brand'];
    companyId = json['CompanyId'];
    company = json['Company'];
    isReturnAllowed = json['IsReturnAllowed'];
    barcode = json['Barcode'];
    autoBarcode = json['AutoBarcode'];
    mainImage = json['MainImage'];
    oldPrice = json['OldPrice'];
    price = json['Price'];
    productTaxes = json['ProductTaxes'];
    addedById = json['AddedById'];
    addedDate = json['AddedDate'];
    updatedById = json['UpdatedById'];
    updatedDate = json['UpdatedDate'];
    isDeleted = json['IsDeleted'];
    showInHomeProductsSection = json['ShowInHomeProductsSection'];
    showInBestSellingSection = json['ShowInBestSellingSection'];
    showInFeaturedProductsSection = json['ShowInFeaturedProductsSection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['NameInArabic'] = nameInArabic;
    data['NameInEnglish'] = nameInEnglish;
    data['DescriptionInArabic'] = descriptionInArabic;
    data['DescriptionInEnglish'] = descriptionInEnglish;
    data['CategoryId'] = categoryId;
    data['Category'] = category;
    data['BrandId'] = brandId;
    data['Brand'] = brand;
    data['CompanyId'] = companyId;
    data['Company'] = company;
    data['IsReturnAllowed'] = isReturnAllowed;
    data['Barcode'] = barcode;
    data['AutoBarcode'] = autoBarcode;
    data['MainImage'] = mainImage;
    data['OldPrice'] = oldPrice;
    data['Price'] = price;
    data['ProductTaxes'] = productTaxes;
    data['AddedById'] = addedById;
    data['AddedDate'] = addedDate;
    data['UpdatedById'] = updatedById;
    data['UpdatedDate'] = updatedDate;
    data['IsDeleted'] = isDeleted;
    data['ShowInHomeProductsSection'] = showInHomeProductsSection;
    data['ShowInBestSellingSection'] = showInBestSellingSection;
    data['ShowInFeaturedProductsSection'] = showInFeaturedProductsSection;
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
