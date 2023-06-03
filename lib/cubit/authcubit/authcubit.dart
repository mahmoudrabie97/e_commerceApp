import 'dart:convert';

import 'package:e_commerce/cubit/authcubit/authstates.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/network/api.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/utilites/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(AuthLoadingState());
    CallApi.postData(
            {'userName': email, 'password': password, 'grant_type': 'password'},
            login,
            context)
        .then((value) {
      if (value!.statusCode == 200) {
        print(value.body);
        final responseBody = json.decode(value.body);
        userModel = UserModel.fromJson(responseBody);
        print(userModel!.accessToken);
        emit(AuthSucsessState());
      } else if (value.statusCode == 400) {
        final responseBody = json.decode(value.body);
        print(responseBody['error_description']);
        ShowMyDialog.showMsg(context, responseBody['error_description']);

        emit(AuthErrorEmailorpasswordState());
      }
    }).catchError((error) {
      print('An error occurred: $error');
      emit(AuthErrorState());
    });
  }
}
