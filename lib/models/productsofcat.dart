class ProductsofCatModel {
  int? id;
  String? nameInArabic;
  String? nameInEnglish;
  dynamic descriptionInArabic;
  dynamic descriptionInEnglish;
  int? categoryId;
  dynamic category;
  int? brandId;
  dynamic brand;
  dynamic companyId;
  dynamic company;
  bool? isReturnAllowed;
  dynamic barcode;
  bool? autoBarcode;
  String? mainImage;
  num? oldPrice;
  num? price;
  dynamic productTaxes;
  dynamic addedById;
  dynamic addedDate;
  dynamic updatedById;
  dynamic updatedDate;
  bool? isDeleted;
  bool? showInHomeProductsSection;
  bool? showInBestSellingSection;
  bool? showInFeaturedProductsSection;

  ProductsofCatModel(
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

  ProductsofCatModel.fromJson(Map<String, dynamic> json) {
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
