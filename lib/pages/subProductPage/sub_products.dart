import 'package:e_commerce/cubit/productcubit/productcubit.dart';
import 'package:e_commerce/pages/subProductPage/widgets/sub_producttem.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

class SubProductPage extends StatelessWidget {
  const SubProductPage({Key? key, required this.productid}) : super(key: key);

  final int productid;

  @override
  Widget build(BuildContext context) {
    double itemWidth = context.screenwidth * 0.4;
    double itemHeight = itemWidth / 0.8;

    return Scaffold(
      appBar: detailspageappbar(context, Text(''), true),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Expanded(
            child: FutureBuilder(
              future: ProductCubit.get(context).getProductdetailsbyproductId(
                  productid: productid, context: context),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error Occurred'));
                } else {
                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: (itemWidth / itemHeight),
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    padding: const EdgeInsets.all(10),
                    children: List.generate(
                        ProductCubit.get(context).productdetailsbyidList.length,
                        (index) {
                      return SubProductitem(
                        productDetailsBypId: ProductCubit.get(context)
                            .productdetailsbyidList[index],
                        height: itemHeight - 30,
                        index: index,
                      );
                    }),
                  );
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
