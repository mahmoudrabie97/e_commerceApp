import 'package:flutter/material.dart';

import '../../../utilites/widgets/custombutton.dart';
import '../../../utilites/widgets/customtext.dart';


class CustomRowDetails extends StatelessWidget {
  const CustomRowDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

       // Image.asset('assets/images/women.png'),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Enas Omar',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 150,
                child: CustomButton(
                  borderRadius: 4,
                  buttonText: 'Upload Photo',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],

    );

  }
}
