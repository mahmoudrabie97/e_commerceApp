class Company {
  final int id;
  final num? addedById;
  final String? addedDate;
  final num? updatedById;
  final String? updatedDate;
  final bool isDeleted;
  final String? nameInArabic;
  final String? nameInEnglish;
  final String? descriptionInArabic;
  final String? descriptionInEnglish;
  final String? tradeRecordFile;
  final String? taxRecordFile;
  final bool isReviewd;
  final String? logo;

  Company({
    required this.id,
    this.addedById,
    this.addedDate,
    this.updatedById,
    this.updatedDate,
    required this.isDeleted,
    this.nameInArabic,
    this.nameInEnglish,
    this.descriptionInArabic,
    this.descriptionInEnglish,
    this.tradeRecordFile,
    this.taxRecordFile,
    required this.isReviewd,
    this.logo,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['Id'],
      addedById: json['AddedById'],
      addedDate: json['AddedDate'],
      updatedById: json['UpdatedById'],
      updatedDate: json['UpdatedDate'],
      isDeleted: json['IsDeleted'],
      nameInArabic: json['NameInArabic'],
      nameInEnglish: json['NameInEnglish'],
      descriptionInArabic: json['DescriptionInArabic'],
      descriptionInEnglish: json['DescriptionInEnglish'],
      tradeRecordFile: json['TradeRecordFile'],
      taxRecordFile: json['TaxRecordFile'],
      isReviewd: json['IsReviewd'],
      logo: json['Logo'],
    );
  }
}

class Product {
  final int id;
  final String? nameInArabic;
  final String? nameInEnglish;
  final String? descriptionInArabic;
  final String? descriptionInEnglish;
  final num categoryId;
  final dynamic category; // can be of type Category or null
  final num brandId;
  final dynamic brand; // can be of type Brand or null
  final num? companyId;
  final Company company;
  final bool isReturnAllowed;
  final dynamic barcode; // can be of type String or null
  final bool autoBarcode;
  final String mainImage;
  final num oldPrice;
  final num price;
  final dynamic productTaxes; // can be of type List<Tax> or null
  final num? addedById;
  final String? addedDate;
  final num? updatedById;
  final String? updatedDate;
  final bool isDeleted;
  final bool showInHomeProductsSection;
  final bool showInBestSellingSection;
  final bool showInFeaturedProductsSection;

  Product({
    required this.id,
    this.nameInArabic,
    this.nameInEnglish,
    this.descriptionInArabic,
    this.descriptionInEnglish,
    required this.categoryId,
    this.category,
    required this.brandId,
    this.brand,
    this.companyId,
    required this.company,
    required this.isReturnAllowed,
    this.barcode,
    required this.autoBarcode,
    required this.mainImage,
    required this.oldPrice,
    required this.price,
    this.productTaxes,
    this.addedById,
    this.addedDate,
    this.updatedById,
    this.updatedDate,
    required this.isDeleted,
    required this.showInHomeProductsSection,
    required this.showInBestSellingSection,
    required this.showInFeaturedProductsSection,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['Id'],
      nameInArabic: json['NameInArabic'],
      nameInEnglish: json['NameInEnglish'],
      descriptionInArabic: json['DescriptionInArabic'],
      descriptionInEnglish: json['DescriptionInEnglish'],
      categoryId: json['CategoryId'],
      category: json['Category'],
      brandId: json['BrandId'],
      brand: json['Brand'],
      companyId: json['CompanyId'],
      company: Company.fromJson(json['Company']),
      isReturnAllowed: json['IsReturnAllowed'],
      barcode: json['Barcode'],
      autoBarcode: json['AutoBarcode'],
      mainImage: json['MainImage'],
      oldPrice: json['OldPrice'],
      price: json['Price'],
      productTaxes: json['ProductTaxes'],
      addedById: json['AddedById'],
      addedDate: json['AddedDate'],
      updatedById: json['UpdatedById'],
      updatedDate: json['UpdatedDate'],
      isDeleted: json['IsDeleted'],
      showInHomeProductsSection: json['ShowInHomeProductsSection'],
      showInBestSellingSection: json['ShowInBestSellingSection'],
      showInFeaturedProductsSection: json['ShowInFeaturedProductsSection'],
    );
  }
}
