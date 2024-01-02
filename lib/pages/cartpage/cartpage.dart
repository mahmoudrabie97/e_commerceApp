import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';
import 'package:e_commerce/models/cartmodel.dart';
import 'package:e_commerce/pages/cartpage/orderdetailspage.dart';
import 'package:e_commerce/pages/cartpage/widgets/cartitem.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  double calculateTotalPrice({required BuildContext context}) {
    double totalPrice = 0.0;
    List<CartModel> cartItems =
        FavouriteCartcubit.get(context).showcartItemsList;
    for (CartModel cartItem in cartItems) {
      totalPrice += (cartItem.quantity! * cartItem.productDetail!.price!);
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    FavouriteCartcubit.get(context).showCartItem(context: context);

    return BlocConsumer<FavouriteCartcubit, FavouriteCartStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: detailspageappbar(
            context,
            const Text('Your Cart',
                style: TextStyle(color: Colors.black, fontSize: 14)),
            false,
          ),
          body: state is ShowCartLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : FavouriteCartcubit.get(context).showcartItemsList.isEmpty
                  ? Center(
                      child: Image.asset(
                        'assets/images/emptycart.jpg',
                        width: 400,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: context.screenheight - 300,
                          child: ListView.separated(
                            itemCount: FavouriteCartcubit.get(context)
                                .showcartItemsList
                                .length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                thickness: .5,
                                color: Colors.green,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return CartItemWidget(
                                cartModel: FavouriteCartcubit.get(context)
                                    .showcartItemsList[index],
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    const CustomText(text: 'Totals'),
                                    const Spacer(),
                                    CustomText(
                                        text:
                                            '\$${calculateTotalPrice(context: context).toString()}')
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50.0, right: 50.0),
                                  child: CustomButton(
                                      borderRadius: 0,
                                      buttonText: 'Continue for payments',
                                      onPressed: () {
                                        //FavouriteCartcubit.get(context).updateCart(context: context, cartModel: )

                                        context.push(OrderDetailsPage(
                                          totalprice: calculateTotalPrice(
                                              context: context),
                                        ));
                                      }),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
