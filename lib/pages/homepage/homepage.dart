import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/cubit/homecubit/homestates.dart';
import 'package:e_commerce/pages/categorypage/categorypage.dart';
import 'package:e_commerce/pages/homepage/widgets/categoryitems.dart';
import 'package:e_commerce/pages/homepage/widgets/customehomebestsellingrow.dart';
import 'package:e_commerce/pages/homepage/widgets/customhomeproductsrow.dart';
import 'package:e_commerce/pages/homepage/widgets/staticcontcat.dart';
import 'package:e_commerce/pages/productconfiguration/widget/customsearchinrow.dart';
import 'package:e_commerce/pages/productpage/widgets/productitems.dart';
import 'package:e_commerce/utilites/dummydata.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePge extends StatelessWidget {
  HomePge({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double itemWidth = context.screenwidth * 0.4;
    double itemHeight = itemWidth / 0.8;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: ListView(
            children: [
              SizedBox(
                width: context.screenwidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.screenwidth * 0.05),
                      child: SizedBox(
                        height: 90,
                        child: SearchingitemRow(
                            searchController: _searchController),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: context.screenwidth * 0.05, top: 4),
                        child: const CustomText(
                          text: 'Category',
                          fontWeight: FontWeight.w500,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: SizedBox(
                        height: 180,
                        child: state is GetSpecificCategoryLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    HomeCubit.get(context).caetgrymodel.length +
                                        1,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index <
                                      HomeCubit.get(context)
                                          .caetgrymodel
                                          .length) {
                                    return CategoryItem(
                                      categoryname: HomeCubit.get(context)
                                          .caetgrymodel[index]
                                          .nameInEnglish,
                                      categoryicon:
                                          'https://www.shutterstock.com/image-photo/business-woman-drawing-global-structure-260nw-1006041130.jpg',

                                      // HomeCubit.get(context)
                                      //      .caetgrymodel[index]
                                      //    .categoryImage ??
                                      //'',
                                    );
                                  } else {
                                    return GestureDetector(
                                        onTap: () {
                                          HomeCubit.get(context)
                                              .getAllCategory(context: context);
                                          context.push(Categorypage());
                                        },
                                        child: const StaticCategoryItem());
                                  }
                                },
                              ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(context.screenwidth * 0.05,
                            0, context.screenwidth * 0.05, 0),
                        child: const CustomhomeBestSellingRow(
                          text: 'Best Selling Items',
                        )),
                    SizedBox(
                      height: 250,
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: (itemWidth / itemHeight),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        padding: const EdgeInsets.all(10),
                        children: List.generate(2, (index) {
                          return Productitem(
                            productModel: dummyproduct[index],
                            height: itemHeight - 30,
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(context.screenwidth * 0.05,
                          0, context.screenwidth * 0.05, 0),
                      child: const CustomhomeProductsRow(
                        text: 'Our Products',
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: (itemWidth / itemHeight),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        padding: const EdgeInsets.all(10),
                        children: List.generate(2, (index) {
                          return Productitem(
                            productModel: dummyproduct[index],
                            height: itemHeight - 30,
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
