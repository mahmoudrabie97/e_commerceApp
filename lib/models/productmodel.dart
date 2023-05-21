class ProductModel {
  final int productid;
  final String productimage;
  final String producttitle;
  final double productprice;
  final String description;

  ProductModel(
      {required this.description,
      required this.productid,
      required this.productimage,
      required this.producttitle,
      required this.productprice});
}
