import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';
import 'package:e_commerce/models/cartmodel.dart';
import 'package:e_commerce/models/product_detailspid.dart';
import 'package:e_commerce/pages/detailspage/widgets/customquntitycontainer.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingToCartRow extends StatelessWidget {
  final int productdetailId;
  final ProductDetailsBypId pmodel;

  //final CartModel cartModel;

  const AddingToCartRow({
    super.key,
    required this.productdetailId,
    required this.pmodel,

    //required this.cartModel, //Text(cartModel.quantity.toString()),
  });

  @override
  Widget build(BuildContext context) {
    print('beforeeeee${pmodel.quantity}');
    return BlocConsumer<FavouriteCartcubit, FavouriteCartStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Row(
          children: [
            Customsquantityontainer(
              height: 60,
              width: 150,
              color: const Color(0xffD5D5D5),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Customsquantityontainer(
                      height: 40,
                      width: 40,
                      color: Colors.white,
                      child: GestureDetector(
                          onTap: () {
                            FavouriteCartcubit.get(context).minusquntity(
                              productquntity: pmodel.quantity,
                              productDetailsBypId: pmodel,
                            );
                          },
                          child: const Center(
                            child: Text('-',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ))),
                  CustomText(text: pmodel.quantity.toString()),
                  //cartModel.quantity.toString()),
                  Customsquantityontainer(
                      height: 40,
                      width: 40,
                      color: Colors.white,
                      child: GestureDetector(
                          onTap: () {
                            FavouriteCartcubit.get(context).plusquntity(
                                productquntity: pmodel.quantity,
                                productDetailsBypId: pmodel);
                          },
                          child: const Icon(Icons.add))),
                ],
              ),
            ),
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
                        : CustomButton(
                            buttonText: 'Add to cart',
                            onPressed: () {
                              FavouriteCartcubit.get(context)
                                  .updateCartFromSubproduct(
                                      context: context,
                                      productDetailsBypId: pmodel);
                              print('afteeeer${pmodel.quantity}');
                              FavouriteCartcubit.get(context).addToCart(
                                  context: context,
                                  productdetailId: productdetailId);
                            },
                            buttonColor: AppColor.kmaincolor,
                            borderRadius: 0,
                          );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
