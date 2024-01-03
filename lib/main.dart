import 'package:e_commerce/cubit/accountcubit/accountcubit.dart';
import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/cubit/productcubit/productcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/network/local_network.dart';
import 'package:e_commerce/pages/homepage/hombottomnav.dart';
import 'package:e_commerce/pages/homepage/homepage.dart';
import 'package:e_commerce/pages/welcomepage.dart';
import 'package:e_commerce/sharedPerference/cash_helper.dart';
import 'package:e_commerce/simpleblocobserver.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './utilites/constants.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashDate.cashInitialization();
  AppConstant.sharedToken =  await CashDate.getData(key: 'token');

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => HomeCubit()
            //..getCategoriesOfDepartment(context: context, departmentId: 6),
            //..getDeprtments(context: context),
            ),
        BlocProvider(
            create: (BuildContext context) => ProductCubit()
              ..getSimilarProduct(
                  productDetailId: 164, productId: 9, context: context)),
        BlocProvider(create: (BuildContext context) => FavouriteCartcubit()),
        BlocProvider(create: (BuildContext context)=>AccountCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.appBgColor,
            primaryColor: AppColor.primary,
          ),
          home:
          AppConstant.sharedToken != null
              ? HomeBottomNav()
              : WelcomePage(),


          ),
    );
  }
}
