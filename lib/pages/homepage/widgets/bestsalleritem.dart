import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/constants.dart';
import 'package:flutter/material.dart';

class BestSellingitem extends StatelessWidget {
  const BestSellingitem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Container(
              width: 170,
              height: 225,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/heart.png'))
                      ],
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/medical 1.png',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Medical Device',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '\$30.99',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Expanded(
                          child: Container(
                            height: 20,
                            width: 20,
                            color: AppColor.kmaincolor,
                            child: Image.asset('assets/images/forwar.png'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
