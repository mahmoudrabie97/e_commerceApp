import 'dart:convert';

import 'package:e_commerce/cubit/homecubit/homestates.dart';
import 'package:e_commerce/network/api.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/categorymodel.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> caetgrymodel = [];
  void getspecificCategoryHome({
    required BuildContext context,
  }) {
    emit(GetSpecificCategoryLoadingState());
    CallApi.getData(
            baseUrl: basehomeurl,
            apiUrl: getspecficCategoryurl,
            context: context)
        .then(
      (value) {
        print(value!.body);
        final responseBody = json.decode(value.body);
        for (var item in responseBody) {
          caetgrymodel.add(CategoryModel.fromJson(item));
        }
        print(' ${caetgrymodel[2].id}');

        emit(GetSpecificCategorySuccsessState());
      },
    ).catchError(
      ((error) {
        GetSpecificCategoryErrorState();
      }),
    );
  }
}
