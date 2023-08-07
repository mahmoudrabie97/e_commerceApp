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
  List<ProductDetailsBypId> ProductdetailsbyidList = [];
  List<ProductDetailsByproductdetailsid>
      getProductDetailsByProductDetailIdList = [];

  Future getProductdetailsbyproductId(
      {required int productid, required BuildContext context}) {
    return CallApi.getData(
            baseUrl: basehomeurl,
            apiUrl: '$getProductDetailsbypidUrl/$productid',
            context: context)
        .then(
      (value) {
        emit(GetProductDetailsLoadingState());
        ProductdetailsbyidList = [];
        print(value!.body);
        final responseBody = json.decode(value.body);
        print('rsponsboy $responseBody');
        for (var item in responseBody) {
          ProductdetailsbyidList.add(ProductDetailsBypId.fromJson(item));
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
            context: context)
        .then(
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
