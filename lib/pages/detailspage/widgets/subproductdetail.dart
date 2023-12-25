import 'package:e_commerce/models/product_detailspid.dart';
import 'package:e_commerce/models/similarproduct.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/detailspage/detailspage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

class SubProductDetailItm extends StatelessWidget {
  const SubProductDetailItm({
    Key? key,
    required this.height,
    required this.productDetailsBypId,
    required this.index,
  }) : super(key: key);

  final double height;
  final SimilarPModel productDetailsBypId;
  final int index;

  @override
  Widget build(BuildContext context) {
    print('pppppppppppppp${productDetailsBypId.id}');
    print('iiiiiiiiiiiiiiiiiii$index');
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Container(
                width: 250,
                height: 250,
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
                            image: NetworkImage(
                                '$baseimageurl${productDetailsBypId.productDetailImages![0].image}')),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(productDetailsBypId.productName ?? '',
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 6),
                                  Text('\$ ${productDetailsBypId.price}',
                                      style:
                                          const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                context.push(DetailsPage(
                                  productDetailId: productDetailsBypId.id ?? 0,
                                  index: index,
                                  productid: productDetailsBypId.productId ?? 0,
                                  // pmodel: productDetailsBypId,
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
