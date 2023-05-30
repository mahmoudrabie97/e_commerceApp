import 'package:e_commerce/pages/productpage/productpage.dart';

import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class CustomhomeProductsRow extends StatelessWidget {
  const CustomhomeProductsRow({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: text,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: IconButton(
            iconSize: context.screenwidth * 0.1,
            onPressed: () {
              context.push(ProductPage());
            },
            icon: Image.asset('assets/images/fowar1.png'),
          ),
        ),
      ],
    );
  }
}
