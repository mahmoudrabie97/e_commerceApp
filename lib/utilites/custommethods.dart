import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

AppBar detailspageappbar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text('Details Product',
        style: TextStyle(color: Colors.black, fontSize: 14)),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
      color: Colors.black,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage('assets/images/Buy1.png'),
          width: context.screenwidth * 0.08,
          height: context.screenwidth * 0.08,
        ),
      )
    ],
  );
}
