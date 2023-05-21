import 'package:e_commerce/pages/homepage/hombottomnav.dart';
import 'package:e_commerce/pages/welcomepage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.appBgColor,
        primaryColor: AppColor.primary,
      ),
      home: WelcomePage(),
    );
  }
}
