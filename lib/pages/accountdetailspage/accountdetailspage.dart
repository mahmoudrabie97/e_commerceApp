
import 'package:e_commerce/pages/accountdetailspage/widgets/customrowdetails.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

import '../../utilites/widgets/custombutton.dart';
import '../../utilites/widgets/customtextformfield.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const CustomText(
          text: 'Account Details',
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(

            children: [
              CustomRowDetails(),
              SizedBox(
                height: 60,
              ),
              CustomTextFormField(
                hintText: 'Name',

                validator:(e){
                  if(e!.isEmpty)
                    {
                      return'enter name';
                    }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: 'Email',
                validator:(e){
                  if(e!.isEmpty)
                  {
                    return'enter name';
                  }
                },

              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: 'Phone Number',
                validator:(e){
                  if(e!.isEmpty)
                  {
                    return'enter name';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 230),
                child:   SizedBox(
                  width: 150,
                  child: CustomButton(
                    borderRadius: 4,
                    buttonText: 'Upload Photo',
                    onPressed: () {},
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
