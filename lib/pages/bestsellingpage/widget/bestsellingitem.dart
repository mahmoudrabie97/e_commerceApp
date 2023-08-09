import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/subProductPage/sub_products.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/dummydata.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

class BestSellingitem extends StatelessWidget {
  const BestSellingitem({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

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
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/heart.png'),
                          )
                        ],
                      ),
                      Expanded(
                        child: Image(
                            image: AssetImage(dummyproduct[0].productimage)),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(dummyproduct[0].producttitle,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    )),
                                const SizedBox(height: 6),
                                Text('\$55',
                                    style: const TextStyle(color: Colors.grey)),
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
                                productid: dummyproduct[0].productid,
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
