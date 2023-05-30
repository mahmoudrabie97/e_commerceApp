import 'package:e_commerce/models/productmodel.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel productModel;
  const CartItemWidget({
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
                  const CustomText(text: 'Air pods max by Apple'),
                  const CustomText(text: 'Variant: Grey', color: Colors.grey),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        const CustomText(text: '\$ 1999,99'),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: IconButton(
                                color: Colors.grey,
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: const Icon(Icons.minimize),
                              ),
                            ),
                            const Text('2'),
                            IconButton(
                              color: Colors.grey,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                            IconButton(
                              color: Colors.grey,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.delete_outline),
                            )
                          ],
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
