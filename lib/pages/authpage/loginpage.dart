import 'package:e_commerce/cubit/authcubit/authcubit.dart';
import 'package:e_commerce/cubit/authcubit/authstates.dart';
import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/pages/homepage/hombottomnav.dart';
import 'package:e_commerce/pages/authpage/signuppage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:e_commerce/utilites/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final FocusNode field1 = FocusNode();
  final FocusNode field2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (BuildContext context, Object? state) {
          if (state is LoginSucsessState) {
            //HomeCubit.get(context).getBestSelling(context: context);

            context.pushreremove(HomeBottomNav());

            // في حاله sucess
            //اللي هي دي داخل cubit
            // يعني دخل pass and email صح
            // // if (value!.statusCode == 200) {
            // print(value.body);
            // final responseBody = json.decode(value.body);
            // userModel = UserModel.fromJson(responseBody);
            // print(userModel!.accessToken);
            // emit(LoginSucsessState());
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            // backgroundColor: Colors.grey.shade100,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
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
                          focusnode: field1,
                          onsubmitted: (value) {
                            FocusScope.of(context).requestFocus(field2);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            } else if (!isEmailValid(value)) {
                              return 'Invalid email format';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        CustomTextFormField(
                          hintText: 'password',
                          suffixicon: AuthCubit.get(context).sufficxicp,
                          suffixpressed: () {
                            AuthCubit.get(context).changeSecurePassword();
                          },
                          controller: _passwordController,
                          obscureText: AuthCubit.get(context).isSecurep,
                          keyboardType: TextInputType.visiblePassword,
                          focusnode: field2,
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
                        state is LoginLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomButton(
                                buttonText: 'Login',
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    Map data = {
                                      'userName': _emailController.text,
                                      'password': _passwordController.text,
                                      'grant_type': 'password'
                                    };
                                    print('emmmmmmmm${_emailController.text}');

                                    AuthCubit.get(context).loginUser(
                                        userdata: data, context: context);
                                  }
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
        },
      ),
    );
  }
}
