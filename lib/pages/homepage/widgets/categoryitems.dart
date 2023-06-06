import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.categoryname,
    required this.categoryicon,
  }) : super(key: key);
  final String categoryname;
  final String categoryicon;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            width: 80,
            child: Text(
              categoryname,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
