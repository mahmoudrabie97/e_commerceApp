import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';
import 'package:e_commerce/models/cartmodel.dart';

import 'package:e_commerce/network/api.dart';
import 'package:e_commerce/utilites/constants.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../models/favouritemodel.dart';
import '../../network/endpoints.dart';

class FavouriteCartcubit extends Cubit<FavouriteCartStates> {
  FavouriteCartcubit() : super(FavouriteCartInitialState());
  static FavouriteCartcubit get(context) => BlocProvider.of(context);

  List<FavouriteModel> getWishlistItemsList = [];
  List<CartModel> showcartItemsList = [];
  IconData icon = IconlyLight.heart;
  bool isvavouriteproduct = false;

  Future getwishlistsitms({required BuildContext context}) {
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };

    emit(GetWishListsLoadingState());

    return CallApi.getData(
      baseUrl: basehomeurl,
      apiUrl: getwishlistsitemurl,
      context: context,
      headers: headers,
    ).then(
      (value) {
        getWishlistItemsList = [];
        if (value!.statusCode == 200) {
          print(value.body);
          final responseBody = json.decode(value.body);
          print('rsponsboy $responseBody');
          log('${AppConstant.token}');
          for (var item in responseBody) {
            getWishlistItemsList.add(FavouriteModel.fromJson(item));
          }
          print(getWishlistItemsList.length);

          emit(GetWishlistsSuccessState());
        } else if (value.statusCode == 401) {
          print(value.body);
          final responseBody = json.decode(value.body);
          print('${AppConstant.token}');
          print('no authhhhhhhhh $responseBody');
        }
      },
    ).catchError(
      ((error) {
        print('errorrr $error');
        emit(GetWishlistsErrorState());
      }),
    );
  }

  void removeItemFromWishlist(
      {required BuildContext context, required int? productid}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      //'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(RemoveWishListsLoadingState());
    CallApi.postData(
            data: {},
            baseUrl: basehomeurl,
            apiUrl: '$removeWishlisturl$productid',
            headers: headers,
            context: context)
        .then((value) {
      if (value!.statusCode == 200) {
        showmessageToast(
            backgroundcolor: Colors.green, message: 'item removed succefully');
        isvavouriteproduct = false;
        getwishlistsitms(context: context);
      } else if (value.statusCode == 400) {
        print('no item in wishlist');
        showmessageToast(
            backgroundcolor: Colors.red, message: 'this item already reomve');
        emit(RemoveWishlistsnotfound());
      }
    }).catchError((error) {
      print(error.toString());
      showmessageToast(
          backgroundcolor: Colors.red,
          message: ' un known error please try again later....... ');
      emit(RemoveWishlistsErrorState());
    });
  }

  Future showCartItem({required BuildContext context}) {
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };

    emit(ShowCartLoadingState());

    return CallApi.getData(
      baseUrl: basehomeurl,
      apiUrl: showcrtitemurl,
      context: context,
      headers: headers,
    ).then(
      (value) {
        showcartItemsList = [];
        if (value!.statusCode == 200) {
          print(value.body);
          final responseBody = json.decode(value.body);
          print('rsponsboy $responseBody');
          log('${AppConstant.token}');
          for (var item in responseBody) {
            showcartItemsList.add(CartModel.fromJson(item));
          }
          print(getWishlistItemsList.length);

          emit(ShowCartSuccessState());
        } else if (value.statusCode == 401) {
          print(value.body);
          final responseBody = json.decode(value.body);
          print('${AppConstant.token}');
          print('no authrization $responseBody');
        }
      },
    ).catchError(
      ((error) {
        print('errorrr $error');
        emit(ShowCartErrorState());
      }),
    );
  }

  void addproductTowishlist(
      {required BuildContext context, required int? productid}) {
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(AddWishListsLoadingState());
    CallApi.postData(
      data: {},
      baseUrl: basehomeurl,
      apiUrl: '$additemtoWishlist$productid',
      headers: headers,
      context: context,
    ).then((value) {
      if (value!.statusCode == 200) {
        isvavouriteproduct = true;
        showmessageToast(
            backgroundcolor: Colors.green, message: 'item added  succefully');

        emit(AddWishlistsSuccessState());
      } else if (value.statusCode == 400) {
        print('no item aadded to wishlist');
        showmessageToast(
            backgroundcolor: Colors.red, message: 'this item already added');
        emit(AddWishlistsnotfound());
      } else {
        print('error');
      }
    }).catchError((error) {
      print(error.toString());
      showmessageToast(
          backgroundcolor: Colors.red,
          message: ' un known error please try again later....... ');
      emit(AddWishlistsErrorState());
    });
  }
}
