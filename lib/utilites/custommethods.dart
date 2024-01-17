import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';
import 'package:e_commerce/models/cartmodel.dart';
import 'package:e_commerce/pages/cartpage/cartpage.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';

bool isEmailValid(String email) {
  final emailRegex = RegExp(r'^[\w-]+(.[\w-]+)*@([\w-]+.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}

void showmessageToast(
    {required String message, required Color backgroundcolor}) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: backgroundcolor,
      textColor: Colors.white,
      fontSize: 16.0);
}

AppBar detailspageappbar(
    BuildContext context, Widget widget, bool ceneredtitle) {
  return AppBar(
    centerTitle: ceneredtitle,
    backgroundColor: Colors.white,
    elevation: 0,
    title: widget,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            context.pushrepacement(const CartPage());
          },
          child: const Cartcount(),
        ),
      )
    ],
  );
}

AppBar cartAppbar(BuildContext context, Widget widget, bool ceneredtitle) {
  return AppBar(
    centerTitle: ceneredtitle,
    backgroundColor: Colors.white,
    elevation: 0,
    title: widget,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
      color: Colors.black,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            context.pushrepacement(const CartPage());
          },
          child: const Cartcount(),
        ),
      )
    ],
  );
}

class Cartcount extends StatelessWidget {
  const Cartcount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int calculatetotalquantity({required BuildContext context}) {
      int totaquantity = 0;
      List<CartModel> showcart =
          FavouriteCartcubit.get(context).showcartItemsList;

      for (CartModel cartitem in showcart) {
        totaquantity += cartitem.quantity ?? 0;
        print('zzzzzzzzzzzzzzzzz$totaquantity');
      }
      return totaquantity;
    }

    return BlocConsumer<FavouriteCartcubit, FavouriteCartStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: [
            Icon(Icons.shopping_cart_outlined, size: 40),
            Positioned(
                child: Container(
              height: 20,
              width: 20,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  FavouriteCartcubit.get(context)
                      .calculateTotallyquantity()
                      .toString(), // عدد العناصر في الـ Cart
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ))
          ],
        );
      },
    );
  }
}

Future<bool?> showExitConfirmationDialog(
    {required BuildContext context}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(''),
        content: const Text('Are You Want to exit?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true); // تأكيد الخروج
            },
          ),
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false); // إلغاء الخروج
            },
          ),
        ],
      );
    },
  );
}
