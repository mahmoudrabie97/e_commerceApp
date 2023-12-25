import 'package:e_commerce/pages/categorypage/productofcategory.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.categoryname,
    required this.categoryicon,
    required this.categoryId,
  }) : super(key: key);
  final String categoryname;
  final String categoryicon;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    print('vvvvvvvvvvvvvvvvvv$categoryId');
    return GestureDetector(
      onTap: () {
        context.push(ProductOfCategory(
          catid: categoryId,
          name: categoryname,
        ));
      },
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            decoration: const BoxDecoration(
                color: Color(0xffECFCFF),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffECFCFF), blurRadius: 4, spreadRadius: 2)
                ]),
            child: Center(
              child: Image(
                image: NetworkImage(
                  categoryicon,
                ),
                height: 100,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              width: 105,
              child: Text(categoryname,
                  style: GoogleFonts.akayaKanadaka(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
