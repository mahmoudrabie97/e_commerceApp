import 'dart:convert';

import 'package:e_commerce/cubit/authcubit/authstates.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/network/api.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/utilites/constants.dart';
import 'package:e_commerce/utilites/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void loginUser({
    required Map userdata,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    CallApi.postData(
      data: userdata,
      baseUrl: baseloginurl,
      apiUrl: loginurl,
      context: context,
    ).then((value) {
      if (value!.statusCode == 200) {
        debugPrint(value.body);
        final responseBody = json.decode(value.body);
        userModel = UserModel.fromJson(responseBody);

        AppConstant.token = userModel!.accessToken;
        debugPrint('token=${AppConstant.token}');
        debugPrint('usrId= ${userModel!.userId}');

        emit(LoginSucsessState());
      } else if (value.statusCode == 400) {
        final responseBody = json.decode(value.body);
        debugPrint(responseBody['error_description']);
        ShowMyDialog.showMsg(context, responseBody['error_description']);

        emit(LoginErrorEmailorpasswordState());
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
    emit(RegisterLoadingState());
    CallApi.postData(
      data: userdata,
      baseUrl: baseregisterurl,
      apiUrl: registerurl,
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
}
