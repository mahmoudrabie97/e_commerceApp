import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customsquarecontainer.dart';
import 'package:flutter/material.dart';

class Sizelist extends StatefulWidget {
  const Sizelist({Key? key}) : super(key: key);

  @override
  State<Sizelist> createState() => _SizelistState();
}

class _SizelistState extends State<Sizelist> {
  final List<String> productsize = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    "XXXL",
  ];
  var currentselected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenwidth * 0.00),
      child: SizedBox(
        height: 150,
        child: GridView.count(
          childAspectRatio: 1.5,
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 14,
          crossAxisSpacing: 90,
          padding: const EdgeInsets.all(10),
          children: List.generate(productsize.length, (index) {
            return GestureDetector(
                onTap: () {},
                child: customsquarecontainer(
                  height: 20,
                  width: 20,
                  text: productsize[index],
                  color: Colors.white,
                ));
          }),
        ),
      ),
    );
  }
}
