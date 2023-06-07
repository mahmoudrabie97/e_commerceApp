import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/cubit/homecubit/homestates.dart';
import 'package:e_commerce/pages/categorypage/widgets/categoryitems.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categorypage extends StatelessWidget {
  const Categorypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = context.screenwidth * 0.4;
    double itemHeight = itemWidth / 0.8;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: detailspageappbar(context,
              const CustomText(text: 'Category', color: Colors.black), true),
          body: state is GetAllCategoryLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: (itemWidth / itemHeight),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                      padding: const EdgeInsets.all(10),
                      children: List.generate(
                          HomeCubit.get(context).allcatgorylist.length,
                          (index) {
                        return CategoryItem(
                          categoryModel:
                              HomeCubit.get(context).allcatgorylist[index],
                          height: itemHeight - 30,
                        );
                      }),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
