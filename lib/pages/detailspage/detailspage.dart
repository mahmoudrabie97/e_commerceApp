import 'package:e_commerce/cubit/productcubit/productcubit.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/detailspage/widgets/addingtocartrow.dart';
import 'package:e_commerce/pages/detailspage/widgets/choosingcolor.dart';
import 'package:e_commerce/pages/detailspage/widgets/detailspricerow.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.productDetailId,
    required this.index,
  }) : super(key: key);
  final int productDetailId;
  final int index;

  @override
  Widget build(BuildContext context) {
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
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: CustomText(
                          text: 'Choose the color',
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const ChoosingColorsWidget(),
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
                      const AddingToCartRow(),
                      const SizedBox(
                        height: 20,
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
