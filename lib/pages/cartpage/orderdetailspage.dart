import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/pages/cartpage/confirmorderpage.dart';
import 'package:e_commerce/pages/cartpage/widgets/orderdetailsitem.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  final double totalprice;
  const OrderDetailsPage({
    Key? key,
    required this.totalprice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppbar(
        context,
        const Text(' Order Details',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.screenheight - 350,
            child: ListView.separated(
              itemCount:
                  FavouriteCartcubit.get(context).showcartItemsList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 19);
              },
              itemBuilder: (BuildContext context, int index) {
                return OrderDetailsItem(
                  cartModel:
                      FavouriteCartcubit.get(context).showcartItemsList[index],
                );
              },
            ),
          ),
          const Spacer(),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      CustomText(text: 'Totals'),
                      Spacer(),
                      CustomText(text: '\$${totalprice.toString()}')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: CustomButton(
                        borderRadius: 0,
                        buttonText: 'Continue for payments',
                        onPressed: () {
                          context.push(ConfirmOrderPage());
                        }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
