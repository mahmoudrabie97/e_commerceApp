class AccountDetailsModel {
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
  String? addedDate;
  String? updatedDate;
  String? email;
  dynamic address;
  List<Roles>? roles;
  List<String>? userRoles;
  List<String>? rolesIds;
  dynamic phoneNumber;
  String? password;

  AccountDetailsModel(
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

  AccountDetailsModel.fromJson(Map<String, dynamic> json) {
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
    if (json['Roles'] != null) {
      roles = <Roles>[];
      json['Roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    userRoles = json['userRoles'].cast<String>();
    rolesIds = json['RolesIds'].cast<String>();
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
    if (this.roles != null) {
      data['Roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    data['userRoles'] = this.userRoles;
    data['RolesIds'] = this.rolesIds;
    data['PhoneNumber'] = this.phoneNumber;
    data['Password'] = this.password;
    return data;
  }
}

class Roles {
  String? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}