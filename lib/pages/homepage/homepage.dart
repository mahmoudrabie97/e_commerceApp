import 'package:e_commerce/pages/homepage/widgets/categoryitems.dart';
import 'package:e_commerce/pages/homepage/widgets/customehometexticonrow.dart';
import 'package:e_commerce/pages/productconfiguration/widget/customsearchingow.dart';
import 'package:e_commerce/pages/productpage/widgets/productitems.dart';
import 'package:e_commerce/utilites/dummydata.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class HomePge extends StatelessWidget {
  HomePge({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double itemWidth = context.screenwidth * 0.4;
    double itemHeight = itemWidth / 0.8;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
            child: SizedBox(
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
                        height: 170,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: dummynames.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CategoryItem(
                              dummynames: dummynames[index],
                              dummyicons: dummyicons[index],
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(context.screenwidth * 0.05,
                            0, context.screenwidth * 0.05, 0),
                        child: const CustomhometexticonRow(
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
                      child: const CustomhometexticonRow(
                        text: 'Our Products',
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: (itemWidth / itemHeight),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        padding: EdgeInsets.all(10),
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
                ))));
  }
}
