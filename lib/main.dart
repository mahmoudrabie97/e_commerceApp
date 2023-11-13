import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/cubit/productcubit/productcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/network/local_network.dart';
import 'package:e_commerce/pages/welcomepage.dart';
import 'package:e_commerce/simpleblocobserver.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './utilites/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await CachNetwork.cachinitilization();
  AppConstant.tokensharedpref = CachNetwork.getcacheData(key: 'token');
  print('tokensh is${AppConstant.tokensharedpref}');

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => HomeCubit(),
        ),
        BlocProvider(create: (BuildContext context) => ProductCubit()),
        BlocProvider(create: (BuildContext context) => FavouriteCartcubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.appBgColor,
            primaryColor: AppColor.primary,
          ),
          home: const WelcomePage()

          //AppConstant.tokensharedpref != null &&
          //      AppConstant.tokensharedpref != ''
          //  ? HomePge()
          //  : const WelcomePage(),
          ),
    );
  }
}
