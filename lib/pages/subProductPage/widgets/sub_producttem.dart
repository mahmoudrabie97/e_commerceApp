import 'package:e_commerce/models/product_detailspid.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/detailspage/detailspage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

class SubProductitem extends StatelessWidget {
  const SubProductitem({
    Key? key,
    required this.height,
    required this.productDetailsBypId,
    required this.index,
  }) : super(key: key);

  final double height;
  final ProductDetailsBypId productDetailsBypId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Container(
                width: 300,
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
                        child: Container(
                            child: Image(
                                image: NetworkImage(
                                    '$baseimageurl${productDetailsBypId.productDetailImages[0].image}'))),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(productDetailsBypId.productName,
                                      style: const TextStyle(
                                          fontSize: 6,
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
                                    productDetailId: productDetailsBypId.id,
                                    index: index));
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
