import 'package:e_commerce/utilites/dummydata.dart';
import 'package:e_commerce/utilites/widgets/customsquarecontainer.dart';
import 'package:flutter/material.dart';

class ChoosingColorsWidget extends StatelessWidget {
  const ChoosingColorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: GridView.count(
        childAspectRatio: 1.4,
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 14,
        crossAxisSpacing: 40,
        padding: const EdgeInsets.all(10),
        children: List.generate(productColors.length, (index) {
          return GestureDetector(
            onTap: () {},
            child: customsquarecontainer(
              height: 25,
              width: 25,
              text: '',
              color: productColors[index],
            ),
          );
        }),
      ),
    );
  }
}
