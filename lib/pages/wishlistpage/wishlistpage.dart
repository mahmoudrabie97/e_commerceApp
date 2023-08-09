import 'package:e_commerce/pages/wishlistpage/widgets/wishlistitem.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/dummydata.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

class WishListsPage extends StatelessWidget {
  const WishListsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailspageappbar(
        context,
        const Text('WishList',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.screenheight - 350,
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 19);
              },
              itemBuilder: (BuildContext context, int index) {
                return WishListItem(
                  productModel: dummyproduct[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
