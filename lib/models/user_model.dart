class UserModel {
  String? accessToken;
  String? tokenType;
  num? expiresIn;
  String? userName;
  String? userId;
  String? issued;
  String? expires;

  UserModel(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.userName,
      this.userId,
      this.issued,
      this.expires});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    userName = json['userName'];
    userId = json['userId'];
    issued = json['.issued'];
    expires = json['.expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['userName'] = userName;
    data['userId'] = userId;
    data['.issued'] = issued;
    data['.expires'] = expires;
    return data;
  }
}
