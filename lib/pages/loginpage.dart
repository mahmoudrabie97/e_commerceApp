import 'package:e_commerce/pages/homepage/hombottomnav.dart';
import 'package:e_commerce/pages/signuppage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/constants.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:e_commerce/utilites/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: 'Login',
                        color: AppColor.mainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'assets/images/icon-person.png',
                        color: AppColor.kmaincolor,
                        height: 40,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const CustomText(
                    text: 'Welcome back ',
                    color: AppColor.kmaincolor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Image.asset('assets/images/Cart-pana.png',
                        height: context.screenheight * .38
                        // height: 400,
                        ),
                  ),
                  CustomTextFormField(
                    hintText: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CustomTextFormField(
                    hintText: 'password',
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  CustomButton(
                    buttonText: 'Login',
                    onPressed: () {
                      context.push(HomeBottomNav());
                    },
                    buttonColor: AppColor.kmaincolor,
                    borderRadius: 12,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const CustomText(
                    text: '                         or login with  ',
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/google.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CustomText(
                          text: 'Google',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: 'You Don’t have an account ? ',
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(SignUpPage());
                        },
                        child: const CustomText(
                          text: 'Sign up',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
