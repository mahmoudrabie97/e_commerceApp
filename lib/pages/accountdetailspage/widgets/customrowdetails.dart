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

        CircleAvatar(
            minRadius: 40,
            maxRadius: 40,
            backgroundColor: Colors.cyan[100],
            child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863'),
                      fit: BoxFit.cover),
                ))),
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
