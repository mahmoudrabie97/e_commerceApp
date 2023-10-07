import 'dart:convert';

import 'package:e_commerce/cubit/productcubit/productsates.dart';
import 'package:e_commerce/models/product_details_bydid.dart';
import 'package:e_commerce/models/product_detailspid.dart';
import 'package:e_commerce/network/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/endpoints.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);
  List<ProductDetailsBypId> productdetailsbyidList = [];
  List<ProductDetailsBypId> filterproductdetailsbyidList = [];
  List<ProductDetailsByproductdetailsid>
      getProductDetailsByProductDetailIdList = [];

  Future getProductdetailsbyproductId(
      {required int productid, required BuildContext context}) {
    emit(GetProductDetailsLoadingState());
    return CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl: '$getProductDetailsbypidUrl/$productid',
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        productdetailsbyidList = [];
        print(value!.body);
        final responseBody = json.decode(value.body);
        print('rsponsboy $responseBody');
        for (var item in responseBody) {
          productdetailsbyidList.add(ProductDetailsBypId.fromJson(item));
        }

        emit(GetProductDetailsSuccessState());
      },
    ).catchError(
      ((error) {
        print('errorrr $error');
        emit(GetProductDetailsErrorState());
      }),
    );
  }

  Future getProductdetailsbyByProductDetailId(
      {required int productDetailId, required BuildContext context}) {
    return CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl: '$getProductDetailsByProductDetailIdUrl/$productDetailId',
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        emit(GetProductDetailsByProductDetailIdLoadingState());
        getProductDetailsByProductDetailIdList = [];
        print(value!.body);
        final responseBody = json.decode(value.body);
        print('rsponsboy $responseBody');
        for (var item in responseBody) {
          getProductDetailsByProductDetailIdList
              .add(ProductDetailsByproductdetailsid.fromJson(item));
          print(
              ' ${getProductDetailsByProductDetailIdList[0].productDetailImages[0].id}');
          print(
              ' ${getProductDetailsByProductDetailIdList[0].productDetailImages[0].image}');
        }

        emit(GetProductDetailsByProductDetailIdSuccessState());
      },
    ).catchError(
      ((error) {
        print('errorrr $error');
        emit(GetProductDetailsByProductDetailIdErrorState());
      }),
    );
  }
}
