import 'package:e_commerce/utilites/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';

import '../../utilites/widgets/custombutton.dart';
import '../../utilites/widgets/customtext.dart';

class ChangePasswordPage extends StatelessWidget {
   ChangePasswordPage({Key? key}) : super(key: key);
   final TextEditingController oldPasswordController = TextEditingController();
   final TextEditingController newPasswordController = TextEditingController();
   final TextEditingController conformPasswordController = TextEditingController();
   final formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: CustomText(
          text: 'Change Password',
        ),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextFormField(
                controller: oldPasswordController,
                hintText: 'Old Password',
                validator:(value){
                  if (value!.isEmpty) {
                    return 'Please enter vaild old password';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: newPasswordController,

                hintText: 'New Password',
                validator:(value){
                  if (value!.isEmpty) {
                    return 'Please enter vaild old password';
                  }

                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
         controller: conformPasswordController,
                hintText: 'Confirm New Password',
                validator:(value){

                  if (value!.isEmpty) {
                    return 'Please enter vaild old password';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 190),
                child: SizedBox(
                  width: 150,
                  child: CustomButton(
                    borderRadius: 4,
                    buttonText: 'Save Changes',
                    onPressed: () {


                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
