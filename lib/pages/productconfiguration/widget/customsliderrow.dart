import 'package:e_commerce/utilites/widgets/customsquarecontainer.dart';
import 'package:flutter/material.dart';

class CustomSliderRow extends StatelessWidget {
  const CustomSliderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          const Expanded(
            child: customsquarecontainer(
                height: 40, width: 80, text: '0 \$ ', color: Color(0xffF2F2F2)),
          ),
          Container(
            color: Colors.grey,
            height: 4,
            width: 50,
          ),
          const Expanded(
            child: customsquarecontainer(
                height: 40,
                width: 80,
                text: '2400 \$ ',
                color: Color(0xffF2F2F2)),
          ),
        ],
      ),
    );
  }
}
