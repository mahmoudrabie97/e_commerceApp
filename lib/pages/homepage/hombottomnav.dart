import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/product_detailspid.dart';
import '../cartpage/cartpage.dart';
import '../categorypage/categorypage.dart';
import '../homepage/homepage.dart';
import '../profilepage/profilepage.dart';
import '../seachpage/searchpage.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({Key? key}) : super(key: key);
  

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int currentindex = 0;
  final List<Widget> pages = <Widget>[
    const HomePge(),
    SearchPage(),
    const CartPage(),
    const Categorypage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? shouldExit = await showExitConfirmationDialog(context: context);
        return shouldExit ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: pages[currentindex],
        bottomNavigationBar: buildBottomNavBar(),
      ),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColor.kmaincolor,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(color: Colors.red),
      currentIndex: currentindex,
      onTap: (value) {
        setState(() {
          currentindex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/Homenav.png',
              height: 22,
              color: AppColor.kmaincolor,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/search.svg',
            ),
            label: 'Search '),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/shopping-cartnav.png',
              height: 22,
            ),
            label: 'My Cart'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/Category.svg',
                color: Colors.black),
            label: 'Category'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon-person.png',
              height: 28,
            ),
            label: 'Profile'),
      ],
    );
  }
}
