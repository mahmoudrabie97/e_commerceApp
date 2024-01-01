import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/cubit/accountcubit/accountstates.dart';
import 'package:e_commerce/models/accountDetailsmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/api.dart';
import '../../network/endpoints.dart';
import '../../network/local_network.dart';
import '../../utilites/constants.dart';
import '../../utilites/widgets/showdialog.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit() : super(AccountInitialState());

  static AccountCubit get(context) => BlocProvider.of(context);


  void changePassword({required Map userdata, required BuildContext context}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(AccountLoadingState());
    CallApi.postData(
      data: userdata,
      baseUrl: basehomeurl,
      apiUrl: changepasswordurl,
      headers: headers,
      context: context,
    ).then((value) async {
      if (value!.statusCode == 200) {
        debugPrint(value.body);
      final  responseBody = json.decode(value.body);
        debugPrint('responseBody$responseBody');
        ShowMyDialog.showMsg(context, responseBody);


        emit(AccountSuccessState());
      }
    }).catchError((error) {
      debugPrint('lamiiiiiiiiiiiiiiiiiiii: $error');
      // ShowMyDialog.showMsg(context, 'An error occurred: $error');
      emit(AccountFailureState());
    });
  }


  AccountDetailsModel? accountDetailsModel;

  void accountDetails({ required BuildContext context}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(AccountLoadingState());
    CallApi.getData(baseUrl: basehomeurl,
        apiUrl: accountdetailsurl,
        context: context,
        headers: headers).then((value) async {
      if (value!.statusCode == 200) {
        debugPrint('mmmmmmmmmmmmmmmmmmmmmmmmm${value.body}');
        Map<String, dynamic> data = json.decode(value.body);
        accountDetailsModel = AccountDetailsModel.fromJson(data);
        debugPrint('data ${accountDetailsModel?.email}');


        emit(AccountSuccessState());
      }
    }).catchError((error) {
      debugPrint('lamiiiiiiiiiiiiiiiiiiii: $error');
      // ShowMyDialog.showMsg(context, 'An error occurred: $error');
      emit(AccountFailureState());
    });
  }
}
