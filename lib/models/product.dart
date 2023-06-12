class ProductHome {
  final int id;
  final String nameInArabic;
  final String nameInEnglish;
  final String? descriptionInArabic;
  final String? descriptionInEnglish;
  final int categoryId;
  final dynamic category;
  final int brandId;
  final dynamic brand;
  final dynamic companyId;
  final dynamic company;
  final bool isReturnAllowed;
  final dynamic barcode;
  final bool autoBarcode;
  final String mainImage;
  final num oldPrice;
  final num price;
  final dynamic productTaxes;
  final dynamic addedById;
  final dynamic addedDate;
  final dynamic updatedById;
  final dynamic updatedDate;
  final bool isDeleted;
  final bool showInHomeProductsSection;
  final bool showInBestSellingSection;
  final bool showInFeaturedProductsSection;

  ProductHome({
    required this.id,
    required this.nameInArabic,
    required this.nameInEnglish,
    required this.categoryId,
    required this.isReturnAllowed,
    required this.autoBarcode,
    required this.mainImage,
    required this.oldPrice,
    required this.price,
    required this.isDeleted,
    required this.showInHomeProductsSection,
    required this.showInBestSellingSection,
    required this.showInFeaturedProductsSection,
    this.descriptionInArabic,
    this.descriptionInEnglish,
    this.category,
    this.brandId = 0,
    this.brand,
    this.companyId,
    this.company,
    this.barcode,
    this.productTaxes,
    this.addedById,
    this.addedDate,
    this.updatedById,
    this.updatedDate,
  });

  factory ProductHome.fromJson(Map<String, dynamic> json) {
    return ProductHome(
      id: json['Id'],
      nameInArabic: json['NameInArabic'],
      nameInEnglish: json['NameInEnglish'],
      descriptionInArabic: json['DescriptionInArabic'],
      descriptionInEnglish: json['DescriptionInEnglish'],
      categoryId: json['CategoryId'],
      category: json['Category'],
      brandId: json['BrandId'] ?? 0,
      brand: json['Brand'],
      companyId: json['CompanyId'],
      company: json['Company'],
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
