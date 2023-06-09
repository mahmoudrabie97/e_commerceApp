import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

AppBar detailspageappbar(
    BuildContext context, Widget widget, bool ceneredtitle) {
  return AppBar(
    centerTitle: ceneredtitle,
    backgroundColor: Colors.white,
    elevation: 0,
    title: widget,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
      color: Colors.black,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: const AssetImage('assets/images/Buy1.png'),
          width: context.screenwidth * 0.08,
          height: context.screenwidth * 0.08,
        ),
      )
    ],
  );
}
