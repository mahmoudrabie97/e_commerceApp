class CategoryModel {
  final int id;
  final String nameInArabic;
  final String nameInEnglish;
  final String descriptionInArabic;
  final String descriptionInEnglish;
  final num commission;
  final bool isPopular;
  final String? categoryImage;
  final String? image;
  final String? categoryIcon;
  final String? icon;
  final bool showInHomeProductsSection;
  final dynamic attributeGroupDtos;

  CategoryModel({
    required this.id,
    required this.nameInArabic,
    required this.nameInEnglish,
    required this.descriptionInArabic,
    required this.descriptionInEnglish,
    required this.commission,
    required this.isPopular,
    required this.categoryImage,
    required this.image,
    required this.categoryIcon,
    required this.icon,
    required this.showInHomeProductsSection,
    required this.attributeGroupDtos,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['Id'],
      nameInArabic: json['NameInArabic'],
      nameInEnglish: json['NameInEnglish'],
      descriptionInArabic: json['DescriptionInArabic'],
      descriptionInEnglish: json['DescriptionInEnglish'],
      commission: json['Commission'].toDouble(),
      isPopular: json['IsPopular'],
      categoryImage: json['CategoryImage'],
      image: json['Image'],
      categoryIcon: json['CategoryIcon'],
      icon: json['Icon'],
      showInHomeProductsSection: json['ShowInHomeProductsSection'],
      attributeGroupDtos: json['attributeGroupDtos'],
    );
  }
}
