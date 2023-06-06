import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/pages/welcomepage.dart';
import 'package:e_commerce/simpleblocobserver.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.appBgColor,
          primaryColor: AppColor.primary,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
