class CheckedCartModel {
  int? id;
  int? productDetailId;
  dynamic productDetail;
  int? quantity;

  CheckedCartModel(
      {this.id, this.productDetailId, this.productDetail, this.quantity});

  CheckedCartModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    productDetailId = json['ProductDetailId'];
    productDetail = json['ProductDetail'];
    quantity = json['Quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['ProductDetailId'] = productDetailId;
    data['ProductDetail'] = productDetail;
    data['Quantity'] = quantity;
    return data;
  }
}
