import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';

import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingToCartRow extends StatefulWidget {
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
  State<AddingToCartRow> createState() => _AddingToCartRowState();
}

class _AddingToCartRowState extends State<AddingToCartRow> {
  @override
  Widget build(BuildContext context) {
    print('POPOPO${widget.productdetailId}');

    FavouriteCartcubit.get(context).checkproductincart(
        context: context, productsetailid: widget.productdetailId);
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
                            ? CustomButtonAnimatuion(
                                buttonText: 'ADD To Cart',
                                onPressed: () {
                                  FavouriteCartcubit.get(context).addToCart(
                                      context: context,
                                      productdetailId: widget.productdetailId);
                                },
                                onPressedtext: () {},
                              )
                            //  CustomButton(

                            //     buttonText: 'Add to cart',
                            //     onPressed: () {
                            //       //print('afteeeer${pmodel.quantity}');
                            //       FavouriteCartcubit.get(context).addToCart(
                            //           context: context,
                            //           productdetailId: widget.productdetailId);
                            //     },
                            //     buttonColor: AppColor.kmaincolor,
                            //     borderRadius: 0,
                            //   )
                            : Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        child: IconButton(
                                          color: Colors.black,
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
                                                        widget.productdetailId);
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      child: Text(
                                        FavouriteCartcubit.get(context)
                                            .checkcartlist[0]
                                            .quantity
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        key: ValueKey(
                                            FavouriteCartcubit.get(context)
                                                .checkcartlist[0]
                                                .quantity),

                                        //cartModel.quantity.toString()
                                      ),
                                      transitionBuilder: (child, animation) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),

                                    CircleAvatar(
                                      child: IconButton(
                                        color: Colors.black,
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
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
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
                                ),
                              ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
