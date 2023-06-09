import 'package:e_commerce/pages/cartpage/widgets/cartitem.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/dummydata.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailspageappbar(
        context,
        const Text('Your Cart',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.screenheight - 350,
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 19);
              },
              itemBuilder: (BuildContext context, int index) {
                return CartItemWidget(
                  productModel: dummyproduct[index],
                );
              },
            ),
          ),
          const Spacer(),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: const [
                      CustomText(text: 'Totals'),
                      Spacer(),
                      CustomText(text: '\$ 2499,99')
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
                        onPressed: () {}),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
