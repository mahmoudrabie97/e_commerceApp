import 'package:flutter/material.dart';

class StaticCategoryItem extends StatelessWidget {
  const StaticCategoryItem({
    Key? key,
  }) : super(key: key);

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
            child: Image.asset(
              'assets/images/Category1.png',
              height: 60,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          child: Center(
            child: Text(
              'ALL',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
