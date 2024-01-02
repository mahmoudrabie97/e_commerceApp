import 'package:e_commerce/models/categorymodel.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/categorypage/productofcategory.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.height,
    required this.categoryModel,
  }) : super(key: key);

  final double height;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ProductOfCategory(
          catid: categoryModel.id,
          name: categoryModel.descriptionInEnglish,
        ));
      },
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 5,
                  left: 5,
                ),
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: Image(
                                image: NetworkImage(
                                    '$baseimageurl${categoryModel.icon ?? 'https://www.shutterstock.com/image-photo/business-woman-drawing-global-structure-260nw-1006041130.jpg '}')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      child: Text(categoryModel.nameInEnglish,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  color: AppColor.kmaincolor,
                                  child:
                                      Image.asset('assets/images/forwar.png'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
