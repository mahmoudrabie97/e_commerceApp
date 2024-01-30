import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce/utilites/appcolors.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color buttonColor;
  final Color txtColor;

  final double borderRadius;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = AppColor.kmaincolor,
    this.borderRadius = 30.0,
    this.txtColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          border: Border.all(color: AppColor.kmaincolor),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16.0,
              color: txtColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonAnimatuion extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Function() onPressedtext;
  final Color buttonColor;
  final Color txtColor;

  final double borderRadius;

  const CustomButtonAnimatuion({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = AppColor.kmaincolor,
    this.borderRadius = 30.0,
    this.txtColor = Colors.white,
    required this.onPressedtext,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: 50.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
            border: Border.all(color: AppColor.kmaincolor),
          ),
          child: Center(
              child: AnimatedTextKit(
            onTap: onPressed,
            // isRepeatingAnimation: true,
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText("ADD To CART",
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  colors: [
                    Colors.white,
                    Colors.white70,
                    Colors.white,
                    Colors.white24
                  ])
              //TyperAnimatedText('ADD TO CART ',
              //  textStyle: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ))),
    );
  }
}
