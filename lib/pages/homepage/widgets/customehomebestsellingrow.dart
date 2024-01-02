import 'package:e_commerce/pages/bestsellingpage/bestselling.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomhomeBestSellingRow extends StatelessWidget {
  const CustomhomeBestSellingRow({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: GoogleFonts.akayaKanadaka(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: IconButton(
            iconSize: context.screenwidth * 0.1,
            onPressed: () {
              context.push(BeststSellingProduct());
            },
            icon: Image.asset('assets/images/fowar1.png'),
          ),
        ),
      ],
    );
  }
}
