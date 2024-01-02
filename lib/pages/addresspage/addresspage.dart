import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:e_commerce/utilites/widgets/customtextfieldm.dart';
import 'package:flutter/material.dart';

import '../../utilites/widgets/customtextformfield.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

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
          text: 'Address',
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(15.0),
          child:  Column(
           crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CustomText(
                text: 'Home Address',
                color: Color(0xff5E9E23),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 15,
              ),

              CustomTextFormField(
                validator: (e){
                  if(e!.isEmpty)
                    {
                      return " enter vaild";
                    }
                },


                hintText: 'Gregory Cartwright936 Kiehn Route',

                perfixicon: Icons.hourglass_empty_sharp,hinnntcolr: Color(0xff5E9E23),),
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: 'Work Address',
                color: Color(0xff5E9E23),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                  validator: (e){
                    if(e!.isEmpty)
                    {
                      return " enter vaild";
                    }
                  },
                  hintText: 'Gregory Cartwright936 Kiehn Route',
                  perfixicon: Icons.shopping_bag_outlined),
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: 'Company Address',
                color: Color(0xff5E9E23),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                  validator: (e){
                    if(e!.isEmpty)
                    {
                      return " enter vaild";
                    }
                  },
                  hintText: 'Gregory Cartwright936 Kiehn Route',
                  perfixicon: Icons.home_work_rounded),

            ],
          ),
        ),
      ),
    );
  }
}
