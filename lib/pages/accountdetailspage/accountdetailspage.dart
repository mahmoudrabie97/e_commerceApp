import 'package:e_commerce/cubit/accountcubit/accountstates.dart';
import 'package:e_commerce/pages/accountdetailspage/widgets/customrowdetails.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/accountcubit/accountcubit.dart';
import '../../utilites/widgets/custombutton.dart';
import '../../utilites/widgets/customtextformfield.dart';

class AccountDetailsPage extends StatelessWidget {
  AccountDetailsPage({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AccountCubit.get(context).accountDetails(context: context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const CustomText(
          text: 'Account Details',
        ),
      ),
      body: BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return State is AccountLoadingState
              ? Center(child: CircularProgressIndicator())
              : Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomRowDetails(),
                          SizedBox(
                            height: 60,
                          ),
                          CustomTextFormField(
                            hintText: AccountCubit.get(context)
                                        .accountDetailsModel
                                        ?.name ==
                                    null
                                ? 'Loading...'
                                : '${AccountCubit.get(context).accountDetailsModel?.name}',
                            validator: (e) {
                              if (e!.isEmpty) {
                                return 'enter name';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            hintText: AccountCubit.get(context)
                                        .accountDetailsModel
                                        ?.email ==
                                    null
                                ? 'Loading...'
                                : '${AccountCubit.get(context).accountDetailsModel?.email}',
                            validator: (e) {
                              if (e!.isEmpty) {
                                return 'enter name';
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            hintText: AccountCubit.get(context)
                                        .accountDetailsModel
                                        ?.name ==
                                    null
                                ? 'Loading...'
                                : '${AccountCubit.get(context).accountDetailsModel!.name}',
                            validator: (e) {
                              if (e!.isEmpty) {
                                return 'enter name';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 230),
                            child: SizedBox(
                              width: 150,
                              child: CustomButton(
                                  borderRadius: 4,
                                  buttonText: 'Conform',
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
