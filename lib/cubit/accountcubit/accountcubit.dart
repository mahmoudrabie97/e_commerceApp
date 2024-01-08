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
import '../../utilites/custommethods.dart';
import '../../utilites/widgets/showdialog.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit() : super(AccountInitialState());

  static AccountCubit get(context) => BlocProvider.of(context);
  String  message='';

  void changePassword({required Map userdata, required BuildContext context}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(ChangePassloadingState());
    CallApi.postData(
      data: userdata,
      baseUrl: basehomeurl,
      apiUrl: changepasswordurl,
      headers: headers,
      context: context,
    ).then((value) async {

     if (value!.statusCode == 200) {

        //debugPrint(value.body);
       final responseBody = json.decode(value.body);
       message=responseBody;
        debugPrint('responseBody$responseBody');

       showmessageToast(message:   '${responseBody
           }', backgroundcolor: Colors.blue);
       Navigator.pop(context);


        emit(ChsngePasswSuccessState());
      }
      else if (value!.statusCode == 400 )
        {
        final responseBody = json.decode(value.body);
          message = responseBody['Message'];
        showmessageToast(message:   '${responseBody['Message']
        }', backgroundcolor: Colors.red);
         emit(ChsngePasswlFailureState());
        }



    }).catchError((error) {
      debugPrint(': $error');
      // ShowMyDialog.showMsg(context, 'An error occurred: $error');
      emit(ChsngePasswlFailureState());
    });
  }


  AccountDetailsModel? accountDetailsModel;

  void accountDetails({ required BuildContext context}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
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
        debugPrint('passsssssssssss ${accountDetailsModel?.password}');


        emit(AccountSuccessState());
      }

    }).catchError((error) {
      debugPrint('lamiiiiiiiiiiiiiiiiiiii: $error');
      // ShowMyDialog.showMsg(context, 'An error occurred: $error');
      emit(AccountFailureState());
    });
  }
}
