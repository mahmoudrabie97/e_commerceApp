import 'package:e_commerce/models/productmodel.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class WishListItem extends StatelessWidget {
  final ProductModel productModel;
  const WishListItem({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        children: [
          Image.asset(
            productModel.productimage,
            fit: BoxFit.fill,
            width: 140,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CustomText(text: 'Air pods max by Apple'),
                      Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.close))
                    ],
                  ),
                  const CustomText(text: 'instock', color: Colors.grey),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        const CustomText(text: '\$ 1999,99'),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                              'assets/images/add-to-cart (5) 2.png'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
