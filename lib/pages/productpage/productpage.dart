import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/pages/productconfiguration/productconfiguration.dart';
import 'package:e_commerce/pages/productpage/widgets/productitems.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import '../productconfiguration/widget/customsearchinrow.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth * 0.4;
    double itemHeight = itemWidth / 0.8;

    return Scaffold(
      appBar: detailspageappbar(context, Text(''), true),
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
                      text: 'Products',
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
                            onPressed: () {
                              context.push(const ProductConfiguration());
                            },
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
                    HomeCubit.get(context).getallproductList.length, (index) {
                  return Productitem(
                    productModel:
                        HomeCubit.get(context).getallproductList[index],
                    height: itemHeight - 30,
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
