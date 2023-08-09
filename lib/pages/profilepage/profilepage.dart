import 'package:e_commerce/pages/cartpage/myorderspage.dart';
import 'package:e_commerce/pages/wishlistpage/wishlistpage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const CustomText(text: 'My Profile', color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                      minRadius: 40,
                      maxRadius: 40,
                      backgroundColor: Colors.cyan[100],
                      child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863'),
                                fit: BoxFit.cover),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    text: 'User one',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildlisttile(
                const Icon(Icons.person, color: AppColor.kmaincolor, size: 29),
                'Account Details'),
            buildlisttile(
                const Icon(Icons.add_location_alt,
                    color: AppColor.kmaincolor, size: 29),
                'Address'),
            GestureDetector(
              onTap: () {
                context.push(const MyOrdersPage());
              },
              child: buildlisttile(
                  const Icon(Icons.edit, color: AppColor.kmaincolor, size: 29),
                  'Orders'),
            ),
            GestureDetector(
              onTap: () {},
              child: buildlisttile(
                  const Icon(Icons.shopping_bag_outlined,
                      color: AppColor.kmaincolor, size: 29),
                  'Change Password'),
            ),
            GestureDetector(
              onTap: () {
                context.push(const WishListsPage());
              },
              child: buildlisttile(
                  const Icon(Icons.favorite,
                      color: AppColor.kmaincolor, size: 29),
                  'Wishlists'),
            ),
            buildlisttile(const Icon(Icons.logout, size: 29), 'Logout'),
          ],
        ),
      ),
    );
  }

  ListTile buildlisttile(Widget leadingwidget, String titleString) {
    return ListTile(
      leading: leadingwidget,
      title: Text(titleString),
      trailing: const Icon(Icons.arrow_forward_ios, size: 29),
    );
  }
}
