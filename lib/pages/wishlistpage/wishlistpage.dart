import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';
import 'package:e_commerce/pages/wishlistpage/widgets/wishlistitem.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/productcubit/productcubit.dart';

class WishListsPage extends StatefulWidget {
  const WishListsPage({Key? key, }) : super(key: key);



  @override
  State<WishListsPage> createState() => _WishListsPageState();

}

class _WishListsPageState extends State<WishListsPage> {

  @override
  Widget build(BuildContext context) {
    FavouriteCartcubit.get(context).getwishlistsitms(context: context);

    return BlocConsumer<FavouriteCartcubit, FavouriteCartStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: detailspageappbar(
            context,
            const Text('WishList',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            false,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.screenheight - 100,
                child: state is GetWishListsLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )
                    : FavouriteCartcubit.get(context)
                            .getWishlistItemsList
                            .isEmpty
                        ? const Center(
                            child: Text(
                              ' No Product  Added to wishlist',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.separated(
                            itemCount: FavouriteCartcubit.get(context)
                                .getWishlistItemsList
                                .length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                color: Colors.green,
                                thickness: .8,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return WishListItem(
                                favouritemodel: FavouriteCartcubit.get(context)
                                    .getWishlistItemsList[index],
                              );
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }
}
