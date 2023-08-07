import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/cubit/homecubit/homestates.dart';
import 'package:e_commerce/cubit/productcubit/productcubit.dart';
import 'package:e_commerce/cubit/productcubit/productsates.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/categorypage/categorypage.dart';
import 'package:e_commerce/pages/homepage/widgets/categoryitems.dart';
import 'package:e_commerce/pages/homepage/widgets/customehomebestsellingrow.dart';
import 'package:e_commerce/pages/homepage/widgets/customhomeproductsrow.dart';
import 'package:e_commerce/pages/homepage/widgets/staticcontcat.dart';
import 'package:e_commerce/pages/productconfiguration/widget/customsearchinrow.dart';
import 'package:e_commerce/pages/productpage/widgets/bestsellingitem.dart';
import 'package:e_commerce/pages/productpage/widgets/productitems.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePge extends StatelessWidget {
  HomePge({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HomeCubit.get(context).getAllCategory(context: context);
    HomeCubit.get(context).getAllProduct(context: context);
    HomeCubit.get(context).getBestSelling(context: context);

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
                child: BlocConsumer<ProductCubit, ProductStates>(
                  listener: (BuildContext context, state) {},
                  builder: (BuildContext context, Object? state) {
                    return Column(
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
                            child: HomeCubit.get(context)
                                    .specificCategorylist
                                    .isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: HomeCubit.get(context)
                                            .specificCategorylist
                                            .length +
                                        1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index <
                                          HomeCubit.get(context)
                                              .specificCategorylist
                                              .length) {
                                        return CategoryItem(
                                          categoryname: HomeCubit.get(context)
                                              .specificCategorylist[index]
                                              .nameInEnglish,
                                          categoryicon:
                                              '$baseimageurl${HomeCubit.get(context).specificCategorylist[index].icon ?? ''}',
                                        );
                                      } else {
                                        return GestureDetector(
                                            onTap: () {
                                              context
                                                  .push(const Categorypage());
                                            },
                                            child: const StaticCategoryItem());
                                      }
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        width: 10,
                                      );
                                    },
                                  ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(
                                context.screenwidth * 0.05,
                                0,
                                context.screenwidth * 0.05,
                                0),
                            child: const CustomhomeBestSellingRow(
                              text: 'Best Selling Items',
                            )),
                        SizedBox(
                          height: 250,
                          child: HomeCubit.get(context)
                                  .bestsellingitemList
                                  .isEmpty
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  childAspectRatio: (itemWidth / itemHeight),
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  padding: const EdgeInsets.all(10),
                                  children: List.generate(
                                      HomeCubit.get(context)
                                          .bestsellingitemList
                                          .length, (index) {
                                    return BestSellingItem(
                                      productModel: HomeCubit.get(context)
                                          .bestsellingitemList[index],
                                      height: itemHeight - 30,
                                    );
                                  }),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              context.screenwidth * 0.05,
                              0,
                              context.screenwidth * 0.05,
                              0),
                          child: const CustomhomeProductsRow(
                            text: 'Our Products',
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          child: HomeCubit.get(context).productList.isEmpty
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  childAspectRatio: (itemWidth / itemHeight),
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  padding: const EdgeInsets.all(10),
                                  children: List.generate(2, (index) {
                                    return Productitem(
                                      productModel: HomeCubit.get(context)
                                          .productList[index],
                                      height: itemHeight - 30,
                                    );
                                  }),
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
