import 'package:e_commerce/models/productmodel.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class MyOrderItem extends StatelessWidget {
  final ProductModel productModel;
  const MyOrderItem({
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
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Air pods max by Apple'),
                  CustomText(text: 'Price: \$200', color: Colors.grey),
                  CustomText(text: 'Qty: 4', color: Colors.grey),
                  CustomText(text: 'Total: \$ 800', color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
