import 'package:e_commerce/cubit/productcubit/productcubit.dart';
import 'package:e_commerce/models/productmodel.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/detailspage/widgets/customcircle.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class DetailsPriceRow extends StatelessWidget {
  const DetailsPriceRow({
    super.key,
    required this.productname,
    required this.price,
  });
  final String productname;
  final num price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: productname, fontSize: 14),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Price :'),
                  Text(
                    '\$${price.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              )
            ],
          ),
        ),
        const Spacer(),
        CustomCircle(
          child: Image.asset('assets/images/heart.png'),
        ),
      ],
    );
  }
}
