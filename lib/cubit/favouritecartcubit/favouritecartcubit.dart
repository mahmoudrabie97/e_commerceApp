import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';
import 'package:e_commerce/models/cartmodel.dart';
import 'package:e_commerce/models/mostviewed.dart';
import 'package:e_commerce/models/product_detailspid.dart';

import 'package:e_commerce/network/api.dart';
import 'package:e_commerce/utilites/constants.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../../models/favouritemodel.dart';
import '../../network/endpoints.dart';

class FavouriteCartcubit extends Cubit<FavouriteCartStates> {
  FavouriteCartcubit() : super(FavouriteCartInitialState());
  static FavouriteCartcubit get(context) => BlocProvider.of(context);

  List<FavouriteModel> getWishlistItemsList = [];
  List<CartModel> showcartItemsList = [];
  List<MostViewed> getMostProductViewedList = [];
  IconData icon = IconlyLight.heart;
  bool isFavouriteproduct = false;
  int quntitycart = 1;
  bool showAnimation = false;
  int animationDuration = 4;

  // هستخدم فكره ال set عشان مفيهاش تكرار (هاخد كل الاي دي الي في الفيفروت واحفظهم في الست )
  Set<String> favouritesId = {};
  int countercart = 0;

////////////////.... Wishlists Functions.../////////////////////

  Future getwishlistsitms({required BuildContext context}) {
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
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
          // log('${AppConstant.token}');
          for (var item in responseBody) {
            getWishlistItemsList.add(FavouriteModel.fromJson(item));
            favouritesId.add(item['ProductDetail']['Id'].toString());
          }
          print('faaaaaaaaaaaaavvv$favouritesId');
          print('dayyyyyyyyyyyyyyyyyyyyy$getWishlistItemsList');
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

  Future<void> addproductTowishlist(
      {required BuildContext context, required int? productdetailsid}) async {
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
    };
    emit(AddWishListsLoadingState());
    CallApi.postData(
      data: {},
      baseUrl: basehomeurl,
      apiUrl: '$additemtoWishlist$productdetailsid',
      headers: headers,
      context: context,
    ).then((value) async {
      if (value!.statusCode == 200) {
        isFavouriteproduct = true;

        //delete

        ////addd
        favouritesId.add(productdetailsid.toString());

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
      {required BuildContext context, required int? productdetailsid}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
    };
    emit(RemoveWishListsLoadingState());
    CallApi.postData(
            data: {},
            baseUrl: basehomeurl,
            apiUrl: '$removeWishlisturl$productdetailsid',
            headers: headers,
            context: context)
        .then((value) {
      if (value!.statusCode == 200) {
        showmessageToast(
            backgroundcolor: Colors.green, message: 'item removed succefully');
        isFavouriteproduct = false;

        favouritesId.remove(productdetailsid.toString());

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

  Future<void> checkProductInWishlist(
      {required int? productdetailsid, required BuildContext context}) async {
    bool isProductInWishlist = false;
    for (var item in getWishlistItemsList) {
      if (item.productDetailId == productdetailsid) {
        isProductInWishlist = true;
        removeItemFromWishlist(
            context: context, productdetailsid: productdetailsid);
      }
    }
    if (!isProductInWishlist) {
      isProductInWishlist = false;
      addproductTowishlist(
          context: context, productdetailsid: productdetailsid);
    }
  }

  ////////////////////////////////// Cart Functions //////////////////
  Future showCartItem({required BuildContext context}) {
    Map<String, String> headers = {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
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

          countercart = showcartItemsList.length;
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

  void addToCart(
      {required BuildContext context, required int? productdetailId}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
    };
    emit(AddToCartLoadingState());
    CallApi.postData(
            data: {},
            baseUrl: basehomeurl,
            apiUrl: '$addingitemtoCart$productdetailId',
            headers: headers,
            context: context)
        .then((value) {
      if (value!.statusCode == 200) {
        showAddedCartAnimation(context);

        countercart = showcartItemsList.length;
        showCartItem(context: context);

        emit(AddToCartSuccessState());
      } else if (value.statusCode == 400) {
        print('no item in wishlist');
        showmessageToast(
            backgroundcolor: Colors.red,
            message: 'ann error occured, try later');
        emit(AddTocartnotfound());
      } else {
        print('errrrror');
      }
    }).catchError((error) {
      print(error.toString());
      showmessageToast(backgroundcolor: Colors.red, message: error.toString());
      emit(AddWTocartErrorState());
    });
  }

  void removeFromCart(
      {required BuildContext context, required int? productdetailId}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      //'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(RemoveFromCartLoadingState());
    CallApi.postData(
            data: {},
            baseUrl: basehomeurl,
            apiUrl: '$removeitemfromCart$productdetailId',
            headers: headers,
            context: context)
        .then((value) {
      if (value!.statusCode == 200) {
        showmessageToast(
            backgroundcolor: Colors.green,
            message: 'item removed from cart succefully');
        showCartItem(context: context);
      } else if (value.statusCode == 400) {
        print('no item in wishlist');
        showmessageToast(
            backgroundcolor: Colors.red,
            message: 'ann error occured, try later');
        countercart = showcartItemsList.length;
        emit(RemoveFromCartcartnotfound());
      } else {
        print('errrrror');
      }
    }).catchError((error) {
      print(error.toString());
      showmessageToast(backgroundcolor: Colors.red, message: error.toString());
      emit(RemoveFromcartErrorState());
    });
  }

  void updateCart(
      {required BuildContext context, required CartModel cartModel}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
    };
    emit(UpdateCartLoadingState());
    CallApi.postData(
            data: {
          'Id': cartModel.id.toString(),
          'ProductDetailId': cartModel.productDetailId.toString(),
          'Quantity': cartModel.quantity.toString(),
        },
            baseUrl: basehomeurl,
            apiUrl: updatecartUrl,
            headers: headers,
            context: context)
        .then((value) {
      if (value!.statusCode == 200) {
        emit(UpdateCartSuccessState());
      } else if (value.statusCode == 400) {
        emit(UpdatecartErrorState());
      } else {
        print('errrrror');
      }
    }).catchError((error) {
      print(error.toString());
      showmessageToast(backgroundcolor: Colors.red, message: error.toString());
      emit(UpdateCartSuccessState());
    });
  }

  void increasequntity(
      {required int? productquntity, required CartModel? cartModel}) {
    productquntity = productquntity! + 1;
    cartModel!.quantity = productquntity;

    emit(IncreaseQuntityState());
  }

  void decreasequntity(
      {required int? productquntity, required CartModel? cartModel}) {
    if (productquntity! > 1) {
      productquntity = productquntity - 1;
      cartModel!.quantity = productquntity;

      emit(DecreaseQuntityState());
    } else {
      print('nooo');
    }
  }

  ////////////////////////
  void plusquntity(
      {required num? productquntity,
      required ProductDetailsBypId? productDetailsBypId}) {
    productquntity = productquntity! + 1;
    productDetailsBypId!.quantity = productquntity;

    emit(PlusQuntityState());
  }

  void minusquntity(
      {required num? productquntity,
      required ProductDetailsBypId? productDetailsBypId}) {
    if (productquntity! > 1) {
      productquntity = productquntity - 1;
      productDetailsBypId!.quantity = productquntity;

      emit((MinusQuntityState()));
    } else {
      print('nooo');
    }
  }

  void updateCartFromSubproduct(
      {required BuildContext context,
      ProductDetailsBypId? productDetailsBypId}) {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
    };
    emit(UpdateCartLoadingState());
    CallApi.postData(
            data: {
          'Id': productDetailsBypId!.id.toString(),
          'ProductDetailId': productDetailsBypId.productId.toString(),
          'Quantity': productDetailsBypId.quantity.toString(),
        },
            baseUrl: basehomeurl,
            apiUrl: updatecartUrl,
            headers: headers,
            context: context)
        .then((value) {
      if (value!.statusCode == 200) {
        emit(UpdateCartSuccessState());
      } else if (value.statusCode == 400) {
        emit(UpdatecartErrorState());
      } else {
        print('errrrror');
      }
    }).catchError((error) {
      print(error.toString());
      showmessageToast(backgroundcolor: Colors.red, message: error.toString());
      emit(UpdateCartSuccessState());
    });
  }

  void showAddedCartAnimation(BuildContext context) {
    showAnimation = true;
    emit(ShowLottileLoadingrState());
    Future.delayed(Duration(seconds: animationDuration), () {
      showAnimation = false;
      Navigator.pop(context);
      emit(
          ShowLottileSucsessState()); // إغلاق الـ Dialog بعد انقضاء المدة الزمنية
    });
    showDialog(
        //barrierColor: Colors.black12,

        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset('assets/images/cartanimation.json',
                      repeat: false,
                      height: 100,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      animate: showAnimation),
                ],
              ),
            ));
  }

  // bool checksetfavourite(
  //     {required productDetailsBypId, required BuildContext context}) {
  //   bool succ = FavouriteCartcubit.get(context)
  //       .favouritesId
  //       .contains(productDetailsBypId.id.toString());
  //   emit(CheckSetFavourite());
  //   return succ;
  // }

//////////////////// ADD MOSTViewed///////////////////
  Future<void> addMostViewed(
      {required BuildContext context, required int? productdetailsid}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      //'Authorization': 'Bearer ${AppConstant.token}'
    };
    emit(AddMostViewedLoadingrState());
    CallApi.postData(
      data: {},
      baseUrl: basehomeurl,
      apiUrl: '$addmostproductuserUrl$productdetailsid',
      headers: headers,
      context: context,
    ).then((value) async {
      if (value!.statusCode == 200) {
        print('Sssssssuccess added mostviewed');

        emit(AddmostViewesSucsessState());
      } else if (value.statusCode == 400) {
        print('Error t ');

        emit(AddMostViewedErrorState());
      } else if (value.statusCode == 404) {
        print('error 404');
      }
    }).catchError((error) {
      print(error.toString());

      emit(AddMostViewedErrorState());
    });
  }

  //////////////////////////////////////////////////////////////////////
  void getMostviewProductUser({
    required BuildContext context,
  }) {
    emit(GetMostViewedProductUserLoadingrState());
    getMostProductViewedList = [];
    CallApi.getData(
      baseUrl: basehomeurl,
      apiUrl: getMostProductUserViewUrl,
      context: context,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
      },
    ).then(
      (value) {
        final response = jsonDecode(value!.body);
        print('ttttttttttttttttt$response');
        for (var item in response) {
          getMostProductViewedList.add(MostViewed.fromJson(item));
        }
        print('oooooooooooooo$getMostProductViewedList');
        print('ggggggggggggggg${getMostProductViewedList.length}');

        emit(GetMostviewedProductUserSuccessState());
      },
    ).catchError(
      (error) {
        print('wwwwwwwwwwwwwwwwww${error.toString()}');
        emit(GetMostviewedProductUserErrorState());
      },
    );
  }

  ///////////////////////////////////////////////
}
