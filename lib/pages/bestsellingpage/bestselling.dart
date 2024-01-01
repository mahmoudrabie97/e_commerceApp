import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/pages/bestsellingpage/widget/bestsellingitem.dart';

import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import '../productconfiguration/widget/customsearchinrow.dart';

class BeststSellingProduct extends StatelessWidget {
  BeststSellingProduct({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth * 0.4;
    double itemHeight = itemWidth / 0.8;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: SizedBox(
                  height: 60,
                  child: SearchingitemRow(searchController: _searchController),
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
                      text: 'Best Selling product  ',
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Row(
                        children: [
                          const CustomText(
                            text: 'filters',
                            fontSize: 12,
                          ),
                          IconButton(
                            iconSize: screenWidth * 0.1,
                            onPressed: () {},
                            icon: Image.asset('assets/images/Filter 2.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: (itemWidth / itemHeight),
                mainAxisSpacing: 15,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(10),
                children: List.generate(
                    HomeCubit.get(context).bestsellingitemList.length, (index) {
                  return BestSellingitem(
                    height: itemHeight - 30,
                    productModel:
                        HomeCubit.get(context).bestsellingitemList[index],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
