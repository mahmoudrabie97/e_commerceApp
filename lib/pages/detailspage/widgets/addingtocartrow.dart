import 'package:e_commerce/pages/detailspage/widgets/customquntitycontainer.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class AddingToCartRow extends StatelessWidget {
  const AddingToCartRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Customsquantityontainer(
          height: 60,
          width: 150,
          color: const Color(0xffD5D5D5),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Customsquantityontainer(
                  height: 40,
                  width: 40,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              CustomText(text: '2'),
              Customsquantityontainer(
                  height: 40,
                  width: 40,
                  color: Colors.white,
                  child: Icon(Icons.add)),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 5),
            child: CustomButton(
              buttonText: 'Add to cart',
              onPressed: () {},
              buttonColor: AppColor.kmaincolor,
              borderRadius: 0,
            ),
          ),
        ),
      ],
    );
  }
}
