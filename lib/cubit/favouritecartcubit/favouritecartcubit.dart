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
  bool isFavouriteproduct = false;

  // هستخدم فكره ال set عشان مفيهاش تكرار (هاخد كل الاي دي الي في الفيفروت واحفظهم في الست )
  Set<String> favouritesId = {};

//////////////////////////////////////////////////// get wish
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
        favouritesId = {};
        if (value!.statusCode == 200) {
          print(value.body);
          final responseBody = json.decode(value.body);
          print('rsponsboy $responseBody');
          log('${AppConstant.token}');
          for (var item in responseBody) {
            getWishlistItemsList.add(FavouriteModel.fromJson(item));
            favouritesId.add(item['ProductId'].toString());
          }
          print(favouritesId);
          // print(getWishlistItemsList.length);

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

//////////////////////////////////////
  ///add product to wishlist
  Future<void> addproductTowishlist(
      {required BuildContext context, required int? productid}) async {
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
    ).then((value) async {
      if (value!.statusCode == 200) {
        isFavouriteproduct = true;

        //delete

        ////addd
        favouritesId.add(productid.toString());

        print(favouritesId);

        showmessageToast(
            backgroundcolor: Colors.green, message: 'item added  succefully');

        await getwishlistsitms(context: context);
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

/////////////////////////////////////
  void removeItemFromWishlist(
      {required BuildContext context, required int? productid}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.token}'
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
        isFavouriteproduct = false;

        favouritesId.remove(productid.toString());

        //delete
        print(favouritesId);

        getwishlistsitms(context: context);
      } else if (value.statusCode == 400) {
        print('no item in wishlist');
        showmessageToast(
            backgroundcolor: Colors.red, message: 'this item already reomve');
        emit(RemoveWishlistsnotfound());
      } else {
        print('errrrror');
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

  void checkProductInWishlist(
      {required int? productId, required BuildContext context}) {
    bool isProductInWishlist = false;
    for (var item in getWishlistItemsList) {
      if (item.product!.id == productId) {
        isProductInWishlist = true;
        removeItemFromWishlist(context: context, productid: productId);
      }
    }
    if (!isProductInWishlist) {
      isProductInWishlist = false;
      addproductTowishlist(context: context, productid: productId);
    }
  }
}
