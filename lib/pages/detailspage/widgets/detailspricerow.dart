import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class DetailsPriceRow extends StatelessWidget {
  const DetailsPriceRow({
    super.key,
    required this.productname,
    required this.price,
    required this.productdetailsid,
  });
  final String productname;
  final num price;
  final int productdetailsid;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCartcubit, FavouriteCartStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        final isProductInWishlist = FavouriteCartcubit.get(context)
            .favouritesId
            .contains(productdetailsid.toString());
        print('pidddddd${productdetailsid.toString()}');
        return Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: productname, fontSize: 14),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Price :'),
                    Text(
                      '\$${price.toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: LikeButton(
                isLiked: isProductInWishlist,
                onTap: (isLiked) {
                  print('itttttttttttt${productdetailsid.toString()}');
                  FavouriteCartcubit.get(context).checkProductInWishlist(
                    context: context,
                    productdetailsid: productdetailsid,
                  );
                  return Future.value(!isLiked);
                }),
            // child: IconButton(
            //     color: isProductInWishlist ? Colors.red : Colors.grey,
            //     onPressed: () {
            //       print('itttttttttttt${productdetailsid.toString()}');
            //       FavouriteCartcubit.get(context).checkProductInWishlist(
            //           context: context, productdetailsid: productdetailsid);
            //     },
            //     icon: isProductInWishlist
            //         ? Icon(Icons.favorite)
            //         : const Icon(IconlyBroken.heart)),
          ),
        ]);
      },
    );
  }
}
