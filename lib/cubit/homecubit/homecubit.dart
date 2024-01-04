// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:e_commerce/cubit/homecubit/homestates.dart';
import 'package:e_commerce/models/bestsellingmodel.dart';
import 'package:e_commerce/models/categoriesofdepmodel.dart';
import 'package:e_commerce/models/departmentmodel.dart';
import 'package:e_commerce/models/mostviewed.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/network/api.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/utilites/constants.dart';
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
  List<MostViewed> getMostViewedList = [];
  List<ProductHome> productList = [];
  List<ProductHome> getallproductList = [];
  List<DepartmentModel> departmentsList = [];
  List<CategoriesOfDepModel> categoriesofdepartmentsList = [];
  int pageindex =
      1; // ده كانه كل مره انت عايز اول مثلا 2 بعدها تاني اتنين وهكدا يعن علي حسب البيج سايز ده اول عدد من البيج سايز وهكدا
  int pageSize = 3; // هنثبت دي بالعدد اللي احنا عايزينه في كل ريكوست
// ده اللي هنعمل بيه listen عشان نعرف ان الليست انتهت
  bool isloadingmore = false;
  ////////////get departments////////////
  void getDeprtments({
    required BuildContext context,
  }) {
    emit(GetDepartmentsLoadingState());
    departmentsList = [];
    CallApi.getData(
        baseUrl: basehomeurl,
        apiUrl: getDepartmentsUrl,
        context: context,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
      (value) {
        //print(value!.body);
        final responseBody = json.decode(value!.body);
        for (var item in responseBody) {
          departmentsList.add(DepartmentModel.fromJson(item));
        }
        //print(' ${specificCategorylist[2].id}');
        print('DDDDDDDDDDDDDDDDDDDDDDDD${departmentsList[0]}');
        print('ooooooooooooooooooooooooooo ${departmentsList[0].image}');

        emit(GetDepartmentsSuccsessState());
      },
    ).catchError(
      ((error) {
        emit(GetDepartmentsErrorState());
      }),
    );
  }

  /////////////////////////////// Paginations/////////
  void getCategoriesOfDepartment({
    required BuildContext context,
    required int departmentId,
    bool fromloadingmore = false,
  }) async {
    if (fromloadingmore) {
      emit(GetCategoriesOfDepartmentsLoadingPaginationState());
    } else {
      emit(GetCategoriesOfDepartmentsLoadingState());
      //// عشان لو هو في مرحله اللودنج العاديه يبدا يصفر  الدنيا خالص ويبدا من الاول عشان يكمل شغله ////
      categoriesofdepartmentsList = [];
      pageindex = 1;
    }
    List<CategoriesOfDepModel> newCategories = [];
    CallApi.getData(
      baseUrl: basehomeurl,
      apiUrl:
          '$getCategoriesOfDepartmentsUrl?departmentId=$departmentId&pageIndex=$pageindex&pageSize=$pageSize',
      context: context,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    ).then(
      (value) {
        //categoriesofdepartmentsList = [];

        final responseBody = json.decode(value!.body);

        if (responseBody.isNotEmpty) {
          for (var item in responseBody) {
            newCategories.add(CategoriesOfDepModel.fromJson(item));
          }

          if (fromloadingmore) {
            categoriesofdepartmentsList.addAll(newCategories);
          } else {
            categoriesofdepartmentsList = newCategories;
          }

          pageindex++;
          emit(GetCategoriesOfDepartmentsSuccsessState());
        } else {
          if (fromloadingmore) {
            emit(GetCategoriesOfDepartmentsPaginationFailedState(
                'No more data available'));
          } else {
            emit(GetCategoriesOfDepartmentsErrorState());
          }
        }
      },
    ).catchError(
      (error) {
        if (fromloadingmore) {
          emit(GetCategoriesOfDepartmentsPaginationFailedState(
              error.toString()));
          emit(InitialHomeState());
        } else {
          emit(GetCategoriesOfDepartmentsErrorState());
        }
      },
    );
  }
  // void getCategoriesOfDepartment({
  //   required BuildContext context,
  //   required int departmentId,
  //   bool fromloadingmore = false,
  // }) async {
  //   if (fromloadingmore) {
  //     GetCategoriesOfDepartmentsLoadingPaginationState();
  //   } else {
  //     emit((GetCategoriesOfDepartmentsLoadingState()));
  //   }

  //   CallApi.getData(
  //       baseUrl: basehomeurl,
  //       // '$getHomeSimilarProductsUrl?productDetailsId=$productDetailId&productId=$productId',
  //       apiUrl: '$getCategoriesOfDepartmentsUrl?departmentId=$departmentId&pageIndex=$pageindex&pageSize=$pageSize',
  //       context: context,
  //       headers: {'Content-Type': 'application/x-www-form-urlencoded'}).then(
  //     (value) {
  //       categoriesofdepartmentsList = [];
  //       //print(value!.body);
  //       final responseBody = json.decode(value!.body);

  //       if (responseBody.isNotEmpty) {
  //         pageindex++;

  //         for (var item in responseBody) {
  //           categoriesofdepartmentsList
  //               .add(CategoriesOfDepModel.fromJson(item));
  //         }
  //       }
  //         pageindex++;

  //       //print('Paginatioooon ${categoriesofdepartmentsList[1].id}');
  //       //print(' ${specificCategorylist[2].id}');
  //       // print('DDDDDDDDDDDDDDDDDDDDDDDD${departmentsList[0]}');
  //       // print('ooooooooooooooooooooooooooo ${departmentsList[0].image}');

  //       emit(GetCategoriesOfDepartmentsSuccsessState());
  //     },
  //   ).catchError(
  //     ((error) async {
  //       if (fromloadingmore) {
  //         emit(GetCategoriesOfDepartmentsPaginationFailedState(
  //             error.toString()));
  //         await Future.delayed(Duration(seconds: 1));
  //         emit(InitialHomeState());
  //       }
  //       print('perror${error.toString()}');
  //       emit(GetCategoriesOfDepartmentsErrorState());
  //     }),
  //   );
  // }

//////////////////////////////////
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

  void getMostviewList({
    required BuildContext context,
  }) {
    emit(GetMostViewsLoadingState());
    getMostViewedList = [];
    CallApi.getData(
      baseUrl: basehomeurl,
      apiUrl: mostviewurl,
      context: context,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${AppConstant.tokensharedpref}'
      },
    ).then(
      (value) {
        print('mmmmmmmmmmmmmmmmmmmmmos$value');
        final response = jsonDecode(value!.body);
        print('ttttttttttttttttt$response');
        for (var item in response) {
          getMostViewedList.add(MostViewed.fromJson(item));
        }
        print('mmmmmmmmmmmmmmmmmmmmmos$getMostViewedList');
        print('IIIIIIIIIIIII${getMostViewedList.length}');

        emit(GetMostviewSuccsessState());
      },
    ).catchError(
      (error) {
        print('wwwwwwwwwwwwwwwwww${error.toString()}');
        emit(GetMostViewErrorState());
      },
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
