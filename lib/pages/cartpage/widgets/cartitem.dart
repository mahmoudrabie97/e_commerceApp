import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/models/cartmodel.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

//t
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
                              child: IconButton(
                                color: Colors.grey,
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  FavouriteCartcubit.get(context)
                                      .decreasequntity(
                                          productquntity: cartModel.quantity,
                                          cartModel: cartModel,
                                          context: context);
                                  FavouriteCartcubit.get(context).updateCart(
                                      context: context, cartModel: cartModel);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            ),
                            Text(cartModel.quantity.toString()),
                            IconButton(
                              color: Colors.grey,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                print('peress');
                                FavouriteCartcubit.get(context).increasequntity(
                                    productquntity: cartModel.quantity,
                                    cartModel: cartModel,
                                    context: context);
                                FavouriteCartcubit.get(context).updateCart(
                                    context: context, cartModel: cartModel);
                              },
                              icon: const Icon(Icons.add),
                            ),
                            IconButton(
                              color: Colors.grey,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                FavouriteCartcubit.get(context).removeFromCart(
                                    context: context,
                                    productdetailId: cartModel.id);
                                FavouriteCartcubit.get(context).updateCart(
                                    context: context, cartModel: cartModel);
                              },
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
