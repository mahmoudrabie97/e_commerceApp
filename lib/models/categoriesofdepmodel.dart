class CategoriesOfDepModel {
  int? id;
  String? nameInArabic;
  String? nameInEnglish;
  String? descriptionInArabic;
  String? descriptionInEnglish;
  num? commission;
  bool? isPopular;
  dynamic categoryImage;
  String? image;
  dynamic categoryIcon;
  String? icon;
  int? categoryAttributeGroupId;
  int? attributeGroupId;
  bool? showInHomeProductsSection;
  dynamic attributeGroups;
  dynamic attributeGroupDtos;
  dynamic categoryAttributeGroupDto;

  CategoriesOfDepModel(
      {this.id,
      this.nameInArabic,
      this.nameInEnglish,
      this.descriptionInArabic,
      this.descriptionInEnglish,
      this.commission,
      this.isPopular,
      this.categoryImage,
      this.image,
      this.categoryIcon,
      this.icon,
      this.categoryAttributeGroupId,
      this.attributeGroupId,
      this.showInHomeProductsSection,
      this.attributeGroups,
      this.attributeGroupDtos,
      this.categoryAttributeGroupDto});

  CategoriesOfDepModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nameInArabic = json['NameInArabic'];
    nameInEnglish = json['NameInEnglish'];
    descriptionInArabic = json['DescriptionInArabic'];
    descriptionInEnglish = json['DescriptionInEnglish'];
    commission = json['Commission'];
    isPopular = json['IsPopular'];
    categoryImage = json['CategoryImage'];
    image = json['Image'];
    categoryIcon = json['CategoryIcon'];
    icon = json['Icon'];
    categoryAttributeGroupId = json['CategoryAttributeGroupId'];
    attributeGroupId = json['AttributeGroupId'];
    showInHomeProductsSection = json['ShowInHomeProductsSection'];
    attributeGroups = json['AttributeGroups'];
    attributeGroupDtos = json['AttributeGroupDtos'];
    categoryAttributeGroupDto = json['CategoryAttributeGroupDto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['NameInArabic'] = nameInArabic;
    data['NameInEnglish'] = nameInEnglish;
    data['DescriptionInArabic'] = descriptionInArabic;
    data['DescriptionInEnglish'] = descriptionInEnglish;
    data['Commission'] = commission;
    data['IsPopular'] = isPopular;
    data['CategoryImage'] = categoryImage;
    data['Image'] = image;
    data['CategoryIcon'] = categoryIcon;
    data['Icon'] = icon;
    data['CategoryAttributeGroupId'] = categoryAttributeGroupId;
    data['AttributeGroupId'] = attributeGroupId;
    data['ShowInHomeProductsSection'] = showInHomeProductsSection;
    data['AttributeGroups'] = attributeGroups;
    data['AttributeGroupDtos'] = attributeGroupDtos;
    data['CategoryAttributeGroupDto'] = categoryAttributeGroupDto;
    return data;
  }
}
