import 'package:e_commerce/cubit/productcubit/productcubit.dart';
import 'package:e_commerce/cubit/productcubit/productsates.dart';
import 'package:e_commerce/pages/categorypage/widgets/productcategoryitem.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../productconfiguration/widget/customsearchinrow.dart';

class ProductOfCategory extends StatefulWidget {
  ProductOfCategory({Key? key, required this.catid, required this.name})
      : super(key: key);
  final int catid;
  final String name;

  @override
  State<ProductOfCategory> createState() => _ProductOfCategoryState();
}

class _ProductOfCategoryState extends State<ProductOfCategory> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    ProductCubit.get(context)
        .getproductscatbyCatID(cattegoryId: widget.catid, context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('zzzzzzzzzzzzz${widget.catid}');
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth * 0.4;
    double itemHeight = itemWidth / 0.8;

    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: BlocConsumer<ProductCubit, ProductStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return state is GetProductOfCatrgoryLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: SizedBox(
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
                                  CustomText(
                                    text: widget.name,
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
                                          icon: Image.asset(
                                              'assets/images/Filter 2.png'),
                                        ),
                                        IconButton(
                                          iconSize: screenWidth * 0.1,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(Icons.arrow_back),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: itemWidth / itemHeight,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 20,
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(10),
                              itemCount: ProductCubit.get(context)
                                  .productsOfcategoryList
                                  .length,
                              itemBuilder: (context, index) {
                                final productsofCatModel =
                                    ProductCubit.get(context)
                                        .productsOfcategoryList[index];
                                return ProductCategoryitem(
                                  height: itemHeight - 30,
                                  productsofCatModel: productsofCatModel,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    );
            },
          ),
        );
      },
    );
  }
}
