import 'package:e_commerce/pages/cartpage/widgets/myorderitem.dart';

import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/dummydata.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailspageappbar(
        context,
        const Text(' Order Details',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        false,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: ExpansionTile(
                  textColor: Colors.black,
                  iconColor: Colors.black,
                  title: const Text(
                    'Order 1',
                    style: TextStyle(color: Colors.black),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(text: 'Order Num : 32334'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CustomText(text: 'Order Status :'),
                              CustomText(
                                text: 'Delivred ',
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(text: 'Total : \$2000'),
                        ),
                        SizedBox(
                          height: context.screenheight - 500,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox();
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return MyOrderItem(
                                productModel: dummyproduct[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
