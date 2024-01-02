import 'package:e_commerce/models/bestsellingmodel.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/subProductPage/sub_products.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

class BestSellingitem extends StatelessWidget {
  const BestSellingitem({
    Key? key,
    required this.height,
    required this.productModel,
  }) : super(key: key);

  final double height;
  final Product productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image(
                            image: NetworkImage(
                                '$baseimageurl${productModel.mainImage}')),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(productModel.nameInEnglish ?? '',
                                    style: const TextStyle(fontSize: 12)),
                                const SizedBox(height: 6),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              // context.push(
                              // DetailsPage(
                              // productModel: productModel
                              //));

                              context.push(SubProductPage(
                                productid: productModel.id,
                                productname: productModel.nameInEnglish ?? '',
                              ));
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              color: AppColor.kmaincolor,
                              child: Image.asset('assets/images/forwar.png'),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
