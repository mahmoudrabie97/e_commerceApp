import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/cubit/homecubit/homestates.dart';

import 'package:e_commerce/pages/categorypage/widgets/categoriesofdepitem.dart';
import 'package:e_commerce/pages/productconfiguration/widget/customsearchinrow.dart';

import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesOfDepartments extends StatefulWidget {
  const CategoriesOfDepartments({Key? key, required this.departmentid})
      : super(key: key);
  final int departmentid;

  @override
  State<CategoriesOfDepartments> createState() =>
      _CategoriesOfDepartmentsState();
}

class _CategoriesOfDepartmentsState extends State<CategoriesOfDepartments> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getCategoriesOfDepartment(
      context: context,
      departmentId: widget.departmentid,
      fromloadingmore: false,
    );
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('zzzzzzzzzzzzz${widget.departmentid}');
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    // double itemWidth = screenWidth * 0.4;
    //double itemHeight = itemWidth / 0.8;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetCategoriesOfDepartmentsLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView(
                        //shrinkWrap: true,
                        children: [
                          SizedBox(
                            width: screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 50),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.05),
                                  child: SizedBox(
                                    height: 60,
                                    child: SearchingitemRow(
                                        searchController: _searchController),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    screenWidth * 0.05,
                                    0,
                                    screenWidth * 0.02,
                                    0,
                                  ),
                                  child: Row(
                                    children: [
                                      const CustomText(
                                        text: 'Categories of Department ',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.arrow_back),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0),
                                        child: Row(
                                          children: [
                                            const CustomText(
                                              text: 'filters',
                                              fontSize: 12,
                                            ),
                                            IconButton(
                                              iconSize: screenWidth * 0.1,
                                              onPressed: () {},
                                              icon: Image.asset(
                                                  'assets/images/Filter 2.png'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                NotificationListener<ScrollNotification>(
                                  onNotification: (notification) {
                                    if (notification.metrics.pixels ==
                                            notification
                                                .metrics.maxScrollExtent &&
                                        notification
                                            is ScrollUpdateNotification) {
                                      print('loading...');
                                      HomeCubit.get(context)
                                          .getCategoriesOfDepartment(
                                        context: context,
                                        departmentId: widget.departmentid,
                                        fromloadingmore: true,
                                      );
                                    }
                                    return true;
                                  },
                                  child: SizedBox(
                                    height: state
                                            is GetCategoriesOfDepartmentsLoadingPaginationState
                                        ? screenheight - 225
                                        : screenheight - 200,
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return CatofDitem(
                                            categoriesOfDepModel: HomeCubit.get(
                                                        context)
                                                    .categoriesofdepartmentsList[
                                                index],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox();
                                        },
                                        itemCount: HomeCubit.get(context)
                                            .categoriesofdepartmentsList
                                            .length),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<HomeCubit, HomeStates>(
                            builder: (context, state) {
                              if (state
                                  is GetCategoriesOfDepartmentsLoadingPaginationState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state
                                  is GetCategoriesOfDepartmentsPaginationFailedState) {
                                return const Center(
                                  child: Text(''),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 60,
      //   child: BlocBuilder<HomeCubit, HomeStates>(
      //     builder: (context, state) {
      //       if (state is GetCategoriesOfDepartmentsLoadingPaginationState) {
      //         return const SafeArea(
      //             child: Center(child: CircularProgressIndicator()));
      //       } else if (state
      //           is GetCategoriesOfDepartmentsPaginationFailedState) {
      //         return Center(
      //           child: Text(state.msg),
      //         );
      //       } else {
      //         return const SizedBox.shrink();
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
