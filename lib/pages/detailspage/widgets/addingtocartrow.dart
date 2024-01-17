import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';
import 'package:e_commerce/models/checkedcartmodel.dart';
import 'package:e_commerce/pages/cartpage/cartpage.dart';

import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingToCartRow extends StatelessWidget {
  final int productdetailId;

  //final ProductDetailsBypId pmodel;

  //final CartModel cartModel;

  const AddingToCartRow({
    super.key,
    required this.productdetailId,
    //required this.pmodel,

    //required this.cartModel, //Text(cartModel.quantity.toString()),
  });

  @override
  Widget build(BuildContext context) {
    FavouriteCartcubit.get(context)
        .checkproductincart(context: context, productsetailid: productdetailId);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 5),
            child: BlocConsumer<FavouriteCartcubit, FavouriteCartStates>(
              listener: (BuildContext context, state) {},
              builder: (BuildContext context, Object? state) {
                return state is AddToCartLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: FavouriteCartcubit.get(context)
                                .checkcartlist
                                .isEmpty
                            ? CustomButton(
                                buttonText: 'Add to cart',
                                onPressed: () {
                                  //print('afteeeer${pmodel.quantity}');
                                  FavouriteCartcubit.get(context).addToCart(
                                      context: context,
                                      productdetailId: productdetailId);
                                },
                                buttonColor: AppColor.kmaincolor,
                                borderRadius: 0,
                              )
                            : Row(
                                children: [
                                  Container(
                                    child: IconButton(
                                      color: Colors.grey,
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        FavouriteCartcubit.get(context)
                                            .decreasequntitybycheck(
                                                productquntity:
                                                    FavouriteCartcubit.get(
                                                            context)
                                                        .checkcartlist[0]
                                                        .quantity,
                                                checkedCartModel:
                                                    FavouriteCartcubit.get(
                                                            context)
                                                        .checkcartlist[0],
                                                context: context,
                                                productdetailsid:
                                                    productdetailId);
                                        FavouriteCartcubit.get(context)
                                            .updateCartbyCheckModel(
                                          context: context,
                                          checkedCartModel:
                                              FavouriteCartcubit.get(context)
                                                  .checkcartlist[0],
                                        );
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                  ),
                                  Text(FavouriteCartcubit.get(context)
                                          .checkcartlist[0]
                                          .quantity
                                          .toString()
                                      //cartModel.quantity.toString()
                                      ),
                                  IconButton(
                                    color: Colors.grey,
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      print('peress');
                                      FavouriteCartcubit.get(context)
                                          .increasequntitybyCheck(
                                              productquntity:
                                                  FavouriteCartcubit.get(
                                                          context)
                                                      .checkcartlist[0]
                                                      .quantity,
                                              checkedCartModel:
                                                  FavouriteCartcubit.get(
                                                          context)
                                                      .checkcartlist[0],
                                              context: context);
                                      FavouriteCartcubit.get(context)
                                          .updateCartbyCheckModel(
                                              context: context,
                                              checkedCartModel:
                                                  FavouriteCartcubit.get(
                                                          context)
                                                      .checkcartlist[0]);
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                  // IconButton(
                                  //   color: Colors.grey,
                                  //   padding: EdgeInsets.zero,
                                  //   onPressed: () {
                                  //     FavouriteCartcubit.get(context).removeFromCart(
                                  //         context: context,
                                  //         productdetailId: cartModel.id);
                                  //     FavouriteCartcubit.get(context).updateCart(
                                  //         context: context, cartModel: cartModel);
                                  //   },
                                  //   icon: const Icon(Icons.delete_outline),
                                  // )
                                ],
                              ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
