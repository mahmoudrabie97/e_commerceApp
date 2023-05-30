import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.dummynames,
    required this.dummyicons,
  }) : super(key: key);
  final String dummynames;
  final Widget dummyicons;

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
            child: dummyicons,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 60,
          child: Text(
            dummynames,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        )
      ],
    );
  }
}
