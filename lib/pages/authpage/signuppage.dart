import 'package:e_commerce/cubit/authcubit/authcubit.dart';
import 'package:e_commerce/cubit/authcubit/authstates.dart';
import 'package:e_commerce/pages/authpage/loginpage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:e_commerce/utilites/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordconfirmationController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (BuildContext context, state) {
          if (state is RegisterSucsessState) {
            context.pushrepacement(LoginPage());
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            //backgroundColor: Colors.grey.shade100,
            body: ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const CustomText(
                      text: 'Sign Up',
                      color: AppColor.kmaincolor,
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
                  text: 'Welcome',
                  color: AppColor.kmaincolor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Image.asset('assets/images/Cart-pana.png',
                      height: context.screenheight * .38),
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: 'Name',
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 14,
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
                        obscureText: true,
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
                        height: 14,
                      ),
                      CustomTextFormField(
                        hintText: 'password confirmation',
                        obscureText: true,
                        controller: _passwordconfirmationController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please re_enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      state is RegisterLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              buttonText: 'Sign Up',
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  Map userdata = {
                                    "Name": "mahmoud Rabie",
                                    "Address": " ",
                                    "Email": _emailController.text,
                                    "Password": _passwordController.text,
                                    "ConfirmPassword":
                                        _passwordconfirmationController.text,
                                    "IsRepresentative": 'false',
                                  };
                                  AuthCubit.get(context).registerUser(
                                      userdata: userdata, context: context);
                                }
                              },
                              buttonColor: AppColor.kmaincolor,
                              borderRadius: 12,
                            ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
