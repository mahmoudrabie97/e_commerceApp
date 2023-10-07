import 'package:e_commerce/models/cartmodel.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartModel;
  const CartItemWidget({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        children: [
          Image.network(
            '$baseimageurl${cartModel.productDetail!.productDetailImage![0].image ?? 'https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg'}',
            fit: BoxFit.fill,
            width: 140,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text:
                          cartModel.productDetail!.productNameInEnglish ?? ''),
                  CustomText(
                      text:
                          'old price: ${cartModel.productDetail!.oldPrice ?? '\$'}',
                      color: Colors.grey),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        CustomText(
                            text:
                                '\$ ${cartModel.productDetail!.price ?? '\$'}'),
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
