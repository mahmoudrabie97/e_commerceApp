import 'package:e_commerce/models/productmodel.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class DetailsPriceRow extends StatelessWidget {
  const DetailsPriceRow({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Medical Device', fontSize: 14),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Text('\$ ${productModel.productprice}'),
                SizedBox(
                  width: 10,
                ),
                Text('( 219 people buy this )',
                    style: TextStyle(
                      fontSize: 10,
                    )),
              ],
            )
          ],
        ),
        Spacer(),
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
              color: Color(0xffECFCFF),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Color(0xffECFCFF), blurRadius: 4, spreadRadius: 2)
              ]),
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/heart.png'),
            ),
          ),
        ),
      ],
    );
  }
}
