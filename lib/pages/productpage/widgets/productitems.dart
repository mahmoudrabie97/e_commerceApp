import 'package:e_commerce/pages/detailspage/detailspage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/models/productmodel.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

class Productitem extends StatelessWidget {
  const Productitem({
    Key? key,
    required this.height,
    required this.productModel,
  }) : super(key: key);

  final double height;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/heart.png'),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Image.asset(productModel.productimage),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(productModel.producttitle,
                                style: TextStyle(fontSize: 12)),
                            SizedBox(height: 6),
                            Text('\$${productModel.productprice}',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Spacer(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.push(
                                  DetailsPage(productModel: productModel));
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              color: AppColor.kmaincolor,
                              child: Image.asset('assets/images/forwar.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
