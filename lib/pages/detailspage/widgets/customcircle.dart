import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final Widget child;
  const CustomCircle({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
          color: Color(0xffECFCFF),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Color(0xffECFCFF), blurRadius: 4, spreadRadius: 2)
          ]),
      child: Center(
        child: IconButton(onPressed: () {}, icon: child),
      ),
    );
  }
}
