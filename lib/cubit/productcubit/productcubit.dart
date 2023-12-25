import 'dart:convert';

import 'package:e_commerce/cubit/productcubit/productsates.dart';
import 'package:e_commerce/models/product_details_bydid.dart';
import 'package:e_commerce/models/product_detailspid.dart';
import 'package:e_commerce/models/productsofcat.dart';
import 'package:e_commerce/models/similarproduct.dart';
import 'package:e_commerce/network/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/endpoints.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);
  List<ProductDetailsBypId> productdetailsbyidList = [];
  List<ProductsofCatModel> productsOfcategoryList = [];
  List<ProductDetailsBypId> filterproductdetailsbyidList = [];
  List<ProductDetailsByproductdetailsid>
      getProductDetailsByProductDetailIdList = [];
  List<SimilarPModel> getSimilarProductList = [];

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

  Future getproductscatbyCatID(
      {required int cattegoryId, required BuildContext context}) {
    emit(GetProductOfCatrgoryLoadingState());

    return CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl: '$getProductsByCategoryId/$cattegoryId',
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        productsOfcategoryList = [];
        print(value!.body);
        final responseBody = json.decode(value.body);
        print('rsponsboy $responseBody');
        for (var item in responseBody) {
          productsOfcategoryList.add(ProductsofCatModel.fromJson(item));
        }
        print('pdpdpdpdpdpd${productsOfcategoryList[0].nameInArabic}');

        emit((GetProductDetailsByProductDetailIdSuccessState()));
      },
    ).catchError(
      ((error) {
        print('errorrr $error');
        emit(GetProductofcategoryErrorState());
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

  Future<void> getSimilarProduct(
      {required int productDetailId,
      required int productId,
      required BuildContext context}) {
    return CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl:
            '$getHomeSimilarProductsUrl?productDetailsId=$productDetailId&productId=$productId',
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        emit((GetSimilarProductLoadingState()));
        getSimilarProductList = [];
        print(value!.body);
        final responseBody = json.decode(value.body);
        print('rsponsboy $responseBody');
        for (var item in responseBody) {
          getSimilarProductList.add(SimilarPModel.fromJson(item));

          // print(
          //' ${getProductDetailsByProductDetailIdList[0].productDetailImages[0].id}');
          // print(
          //     ' ${getProductDetailsByProductDetailIdList[0].productDetailImages[0].image}');
        }
        print('999999999999999${getSimilarProductList}');
        print('999999999999999${getSimilarProductList[0].id}');

        emit(GetSimilarProductSuccessState());
      },
    ).catchError(
      ((error) {
        print('[errorrr] $error');
        emit(GetSimilarProductErrorState());
      }),
    );
  }

  ////////////////////////// Filter Cart ////////////
  /////////////////////////////getcategories of department/////////////////////////
}
