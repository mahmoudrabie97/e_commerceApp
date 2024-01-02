import 'package:e_commerce/models/cartmodel.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class OrderDetailsItem extends StatelessWidget {
  final CartModel cartModel;

  const OrderDetailsItem({
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
                          'Price: \$${cartModel.productDetail!.price.toString()}}',
                      color: Colors.grey),
                  CustomText(
                      text: 'Qty:${cartModel.quantity.toString()} ',
                      color: Colors.grey),
                  CustomText(
                      text:
                          'Total: \$ ${cartModel.quantity! * (cartModel.productDetail!.price)!}',
                      color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
