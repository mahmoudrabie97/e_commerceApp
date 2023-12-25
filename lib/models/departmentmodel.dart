class DepartmentModel {
  int? id;
  String? nameInArabic;
  String? nameInEnglish;
  String? descriptionInArabic;
  String? descriptionInEnglish;
  int? companyId;
  dynamic departmentImage;
  String? image;

  DepartmentModel(
      {this.id,
      this.nameInArabic,
      this.nameInEnglish,
      this.descriptionInArabic,
      this.descriptionInEnglish,
      this.companyId,
      this.departmentImage,
      this.image});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nameInArabic = json['NameInArabic'];
    nameInEnglish = json['NameInEnglish'];
    descriptionInArabic = json['DescriptionInArabic'];
    descriptionInEnglish = json['DescriptionInEnglish'];
    companyId = json['CompanyId'];
    departmentImage = json['DepartmentImage'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['NameInArabic'] = this.nameInArabic;
    data['NameInEnglish'] = this.nameInEnglish;
    data['DescriptionInArabic'] = this.descriptionInArabic;
    data['DescriptionInEnglish'] = this.descriptionInEnglish;
    data['CompanyId'] = this.companyId;
    data['DepartmentImage'] = this.departmentImage;
    data['Image'] = this.image;
    return data;
  }
}
