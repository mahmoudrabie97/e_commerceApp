import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/cubit/productcubit/productcubit.dart';
import 'package:e_commerce/models/product_detailspid.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/detailspage/widgets/addingtocartrow.dart';
import 'package:e_commerce/pages/detailspage/widgets/detailspricerow.dart';
import 'package:e_commerce/pages/detailspage/widgets/subproductdetail.dart';
import 'package:e_commerce/utilites/constants.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.productDetailId,
    required this.index,
    required this.pmodel,
  }) : super(key: key);
  final int productDetailId;
  final ProductDetailsBypId pmodel;
  final int index;

  @override
  Widget build(BuildContext context) {
    ProductCubit.get(context).getProductdetailsbyByProductDetailId;
    print('iddddddddddddddddd$productDetailId');
    double itemWidth = context.screenwidth * 0.4;
    double itemHeight = itemWidth / 0.8;
    //ProductCubit.get(context)
    //    .getProductdetailsbyproductId(productid: productid, context: context);
    return Scaffold(
      appBar: detailspageappbar(
        context,
        const Text(
          'Details Product',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        true,
      ),
      body: FutureBuilder(
        future: ProductCubit.get(context).getProductdetailsbyByProductDetailId(
            productDetailId: productDetailId, context: context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            final List<ProductDetailsBypId> filteredList =
                ProductCubit.get(context)
                    .productdetailsbyidList
                    .where((item) => item.id != productDetailId)
                    .toList();
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Image(
                          width: 400,
                          image: NetworkImage(
                              '$baseimageurl${ProductCubit.get(context).getProductDetailsByProductDetailIdList[0].productDetailImages[0].image}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DetailsPriceRow(
                        productname: ProductCubit.get(context)
                            .productdetailsbyidList[index]
                            .categoryName,
                        price: ProductCubit.get(context)
                            .productdetailsbyidList[index]
                            .price,
                        productdetailsid: productDetailId,
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      const CustomText(
                        text: 'Description ',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: CustomText(
                            text: ProductCubit.get(context)
                                    .getProductDetailsByProductDetailIdList[0]
                                    .productDetailImages[0]
                                    .productDetail ??
                                'No description added For this product  ',
                            fontSize: 12,
                            color: const Color(0xff393F42)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AddingToCartRow(
                        productdetailId: productDetailId, pmodel: pmodel,
                        // cartModel: FavouriteCartcubit.get(context)
                        //   .showcartItemsList[index],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        // margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const CustomText(
                          text: 'Browse similar products interesting',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        child: GridView.count(
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          childAspectRatio: .8,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          padding: const EdgeInsets.all(10),
                          children: List.generate(filteredList.length, (index) {
                            return SubProductDetailItm(
                              productDetailsBypId: filteredList[index],
                              height: itemHeight - 30,
                              index: index,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
