import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/cubit/homecubit/homestates.dart';
import 'package:e_commerce/pages/categorypage/widgets/categoryitems.dart';
import 'package:e_commerce/pages/categorypage/widgets/departmentitem.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categorypage extends StatelessWidget {
  Categorypage({Key? key}) : super(key: key);
  final List<String> texts = ['Devices', 'Tools', 'New Dep', 'Men Clothes'];

  @override
  Widget build(BuildContext context) {
    double itemWidth = context.screenwidth * 0.4;
    double itemHeight = itemWidth / 0.8;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: detailspageappbar(context,
              const CustomText(text: 'Department', color: Colors.black), true),
          body: state is GetAllCategoryLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return DepartmentItem(
                              categoryname: texts[index],
                              categoryicon:
                                  'https://www.shutterstock.com/shutterstock/photos/1006041130/display_1500/stock-photo-business-woman-drawing-global-structure-networking-and-data-exchanges-customer-connection-on-dark-1006041130.jpg');
                        },
                      ),
                    ),
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
