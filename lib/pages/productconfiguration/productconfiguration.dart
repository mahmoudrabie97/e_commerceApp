import 'package:e_commerce/pages/productconfiguration/widget/customslider.dart';
import 'package:e_commerce/pages/productconfiguration/widget/customsliderrow.dart';
import 'package:e_commerce/pages/productconfiguration/widget/productcolorswidget.dart';
import 'package:e_commerce/pages/productconfiguration/widget/searchingrowconf.dart';
import 'package:e_commerce/pages/productconfiguration/widget/sizewidget.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customsquarecontainer.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class ProductConfiguration extends StatelessWidget {
  const ProductConfiguration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: context.screenwidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.screenwidth * 0.02),
                child: SizedBox(
                  height: 90,
                  child: Row(
                    children: [
                      CustomText(text: 'Product Size'),
                      SizedBox(
                        width: context.screenwidth * 0.07,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: customsquarecontainer(
                          height: 40,
                          width: 80,
                          text: 'Reset',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Sizelist(),
              Divider(
                color: Color(0xffECECEC),
                thickness: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.screenwidth * 0.04),
                child: SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      CustomText(text: 'Colors'),
                      SizedBox(
                        width: context.screenwidth * 0.07,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: customsquarecontainer(
                          height: 40,
                          width: 80,
                          text: 'Reset',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ProductColors(),
              Divider(
                color: Color(0xffECECEC),
                thickness: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomText(text: 'price'),
              ),
              CustomSliderRow(),
              SizedBox(
                height: 20,
              ),
              CustomSlider(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomText(text: 'Search'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SearchinRowConfig(),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
