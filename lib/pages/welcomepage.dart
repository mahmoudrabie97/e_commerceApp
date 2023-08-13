import 'package:e_commerce/pages/authpage/loginpage.dart';
import 'package:e_commerce/pages/authpage/signuppage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 70),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: '   Welcome To ',
                color: AppColor.kmaincolor,
                fontSize: 32,
              ),
              CustomText(
                text: '    E-Commerce ',
                color: AppColor.kmaincolor,
                fontSize: 32,
              ),
            ],
          ),
          Image.asset('assets/images/Cart-amico.png',
              height: context.screenheight * .49),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(
              right: 50,
              left: 50,
            ),
            child: CustomButton(
              buttonText: 'Sign In',
              onPressed: () {
                context.push(LoginPage());
              },
              buttonColor: AppColor.kmaincolor,
              borderRadius: 10,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(
              right: 50,
              left: 50,
            ),
            child: CustomButton(
              buttonText: 'Sign Up',
              onPressed: () {
                context.push(SignUpPage());
              },
              buttonColor: Colors.white,
              borderRadius: 10,
              txtColor: AppColor.kmaincolor,
            ),
          )
        ],
      ),
    );
  }
}
