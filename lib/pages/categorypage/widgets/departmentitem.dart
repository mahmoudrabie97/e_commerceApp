import 'package:e_commerce/pages/categorypage/widgets/catofofdepartment.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

class DepartmentItem extends StatelessWidget {
  const DepartmentItem({
    Key? key,
    required this.categoryname,
    required this.categoryicon,
    required this.departmentId,
  }) : super(key: key);
  final String categoryname;
  final String categoryicon;
  final int departmentId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(CategoriesOfDepartments(
          departmentid: departmentId,
        ));

        ///هيحثل تغيير هنا لاني كل ديبرتمنت ليهكاتوجري مش برودكت
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
              child: Text(
                categoryname,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
