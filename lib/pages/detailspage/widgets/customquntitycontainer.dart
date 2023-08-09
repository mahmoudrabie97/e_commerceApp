import 'package:flutter/material.dart';

class Customsquantityontainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  final Color color;

  const Customsquantityontainer({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
          border: Border.all(width: 2, color: Colors.grey.withOpacity(.4))),
      child: child,
    );
  }
}
