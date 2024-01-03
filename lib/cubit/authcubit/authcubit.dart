import 'dart:convert';

import 'package:e_commerce/cubit/authcubit/authstates.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/network/api.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/network/local_network.dart';
import 'package:e_commerce/utilites/constants.dart';
import 'package:e_commerce/utilites/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../sharedPerference/cash_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  IconData sufficxicp = Icons.visibility_off;
  IconData sufficxicpc = Icons.visibility_off;
  bool isSecurep = true;
  bool isSecurepc = true;
  UserModel? userModel;
  bool showAnimation = false;
  int animationDuration = 2;

  void changeSecurePassword() {
    if (isSecurep) {
      sufficxicp = Icons.visibility_off;
      isSecurep = false;
    } else {
      sufficxicp = Icons.remove_red_eye_outlined;
      isSecurep = true;
    }
    emit(ChangesecurepasswordState());
  }

  void changeSecurePasswordconfig() {
    if (isSecurepc) {
      sufficxicpc = Icons.visibility_off;
      isSecurepc = false;
    } else {
      sufficxicpc = Icons.remove_red_eye_outlined;
      isSecurepc = true;
    }
    emit(ChangesecurepasswordconfigState());
  }

  void loginUser({
    required Map userdata,
    required BuildContext context,
  }) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      //'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(LoginLoadingState());
    CallApi.postData(
      data: userdata,
      baseUrl: basehomeurl,
      apiUrl: loginurl,
      headers: headers,
      context: context,
    ).then((value) async {
      if (value!.statusCode == 200) {
        debugPrint(value.body);
        final responseBody = json.decode(value.body);
        userModel = UserModel.fromJson(responseBody);

        AppConstant.token = userModel!.accessToken;
        CashDate.setDate(key: 'token', value: userModel?.accessToken);

        emit(LoginSucsessState());
      } else if (value.statusCode == 400) {
        final responseBody = json.decode(value.body);
        debugPrint(responseBody['error_description']);
        ShowMyDialog.showMsg(context, responseBody['error_description']);

        print(value.body);

        emit(LoginErrorEmailorpasswordState());
      } else if (value.statusCode == 500) {
        ShowMyDialog.showMsg(context, 'internal server error,');
        emit(LoginServerErrorState());
      } else {
        ShowMyDialog.showMsg(context, 'unknown error,');
        emit(LoginErrorState());
      }
    }).catchError((error) {
      debugPrint('An error occurred: $error');
      // ShowMyDialog.showMsg(context, 'An error occurred: $error');
      emit(LoginErrorState());
    });
  }

  void registerUser({
    required Map userdata,
    required BuildContext context,
  }) {
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(RegisterLoadingState());
    CallApi.postData(
      data: userdata,
      baseUrl: baseregisterurl,
      apiUrl: registerurl,
      headers: headers,
      context: context,
    ).then((value) {
      if (value!.statusCode == 200) {
        emit(RegisterSucsessState());
      } else if (value.statusCode == 500) {
        final responseBody = json.decode(value.body);
        debugPrint(responseBody['Message']);
        ShowMyDialog.showMsg(context, responseBody['Message']);
        emit(RegisterErrorDataState());
      }
    }).catchError((error) {
      debugPrint('An error occurred: $error');
      // ShowMyDialog.showMsg(context, 'An error occurred: $error');
      emit(RegisterErrorState());
    });
  }

  void showDialoog(BuildContext context) {
    showAnimation = true;
    emit(ShowLottileLoadingrState());
    Future.delayed(Duration(seconds: animationDuration), () {
      showAnimation = false;
      Navigator.pop(context);
      emit(
          ShowLottileSucsessState()); // إغلاق الـ Dialog بعد انقضاء المدة الزمنية
    });
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset('assets/images/ddone.json',
                      repeat: false,
                      height: 100,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      animate: showAnimation),
                ],
              ),
            ));
  }
}
