// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:e_commerce/cubit/homecubit/homestates.dart';
import 'package:e_commerce/models/bestsellingmodel.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/network/api.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/categorymodel.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> specificCategorylist = [];
  List<CategoryModel> allcatgorylist = [];
  List<Product> bestsellingitemList = [];
  List<ProductHome> productList = [];
  List<ProductHome> getallproductList = [];

  void getspecificCategoryHome({
    required BuildContext context,
  }) {
    emit(GetSpecificCategoryLoadingState());
    specificCategorylist = [];
    CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl: getspecficCategoryurl,
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        //print(value!.body);
        final responseBody = json.decode(value!.body);
        for (var item in responseBody) {
          specificCategorylist.add(CategoryModel.fromJson(item));
        }
        print(' ${specificCategorylist[2].id}');

        emit(GetSpecificCategorySuccsessState());
      },
    ).catchError(
      ((error) {
        emit(GetSpecificCategoryErrorState());
      }),
    );
  }

  void getAllCategory({
    required BuildContext context,
  }) {
    emit(GetAllCategoryLoadingState());

    allcatgorylist = [];
    CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl: getAllCategories,
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        // print(value!.body);
        final responseBody = json.decode(value!.body);
        for (var item in responseBody) {
          allcatgorylist.add(CategoryModel.fromJson(item));
        }
        //print(' ${caetgrymodel[2].id}');

        emit(GetAllCategorySuccsessState());
      },
    ).catchError(
      ((error) {
        emit(GetAllCategoryErrorState());
      }),
    );
  }

  void getBestSelling({
    required BuildContext context,
  }) {
    emit(GetBestSellingLoadingState());
    bestsellingitemList = [];
    CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl: getBestSellingurl,
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        print(value!.body);
        final responseBody = json.decode(value.body);
        print('rsponsboy $responseBody');
        print('successsssssssssssssssss');
        for (var item in responseBody) {
          bestsellingitemList.add(Product.fromJson(item));
        }

        emit(GetBestSellingSuccsessState());
      },
    ).catchError(
      ((error) {
        print('errorrr $error');
        emit(GetBestSellingErrorState());
      }),
    );
  }

  void getspecificProduct({
    required BuildContext context,
  }) {
    emit(GetSpecificProductLoadingState());
    productList = [];
    CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl: getSpecificProductsurl,
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        print(value!.body);
        final responseBody = json.decode(value.body);
        for (var item in responseBody) {
          productList.add(ProductHome.fromJson(item));
        }

        emit(GetSpecificProductSuccsessState());
      },
    ).catchError(
      ((error) {
        emit(GetSpecificProductErrorState());
      }),
    );
  }

  void getAllProduct({
    required BuildContext context,
  }) {
    emit(GetAllProductLoadingState());
    getallproductList = [];
    CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl: getAllProductsurl,
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        print(value!.body);
        final responseBody = json.decode(value.body);
        for (var item in responseBody) {
          getallproductList.add(ProductHome.fromJson(item));
        }

        emit(GetAllProductSuccsessState());
      },
    ).catchError(
      ((error) {
        emit(GetAllProductErrorState());
      }),
    );
  }

  //////////////////////////////Filter product////////////////////////
  void filterProduct({
    required BuildContext context,
    required String searchtext,
  }) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(FilterProductLoadingState());
    CallApi.postData(
            data: {
          "SearchText": searchtext,
          "MinPriceText": '0',
          "MaxPriceText": '0',
          "productId": '0'
        },
            baseUrl: basehomeurl,
            apiUrl: getfilterproductUrl,
            headers: headers,
            context: context)
        .then((value) {
      if (value!.statusCode == 200) {
        print(value.body);
        emit(FilterProductSuccessState());
      } else if (value.statusCode == 400) {
        emit(FilterProductErrorState());
      } else {
        print('errrrror');
      }
    }).catchError((error) {
      print(error.toString());
      showmessageToast(backgroundcolor: Colors.red, message: error.toString());
      emit(FilterProductErrorState());
    });
  }
}
