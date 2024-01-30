import 'package:e_commerce/cubit/accountcubit/accountcubit.dart';
import 'package:e_commerce/cubit/accountcubit/accountstates.dart';
import 'package:e_commerce/utilites/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilites/widgets/custombutton.dart';
import '../../utilites/widgets/customtext.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const CustomText(
              text: 'Change Password',
            ),
          ),
          body: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: oldPasswordController,
                      hintText: 'Old Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter vaild old password';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: newPasswordController,
                      hintText: 'New Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter vaild old password';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: conformPasswordController,
                      hintText: 'Confirm New Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter vaild old password';
                        }
                        if (newPasswordController.text !=
                            conformPasswordController.text) {
                          return ' please enter correct conform password';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    State is ChangePassloadingState
                        ? const CircularProgressIndicator()
                        : Padding(
                            padding: const EdgeInsets.only(left: 190),
                            child: SizedBox(
                              width: 150,
                              child: CustomButton(
                                borderRadius: 4,
                                buttonText: 'Save Changes',
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    Map data = {
                                      'OldPassword': oldPasswordController.text,
                                      'NewPassword': newPasswordController.text,
                                      'ConfirmPassword':
                                          conformPasswordController.text,
                                    };
                                    //print('emmmmmmmm${newPasswordController.text}');

                                    AccountCubit.get(context).changePassword(
                                        userdata: data, context: context);
                                    //   ShowMyDialog.widgetshowMsg(
                                    //     context,
                                    //     AccountCubit.get(context).responseBody == null
                                    //         ?  snackBar
                                    //         : Text(
                                    //         '${AccountCubit.get(context).responseBody}'));
                                  }
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
