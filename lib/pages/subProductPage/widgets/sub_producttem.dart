import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/favouritecartcubit/favouritecartstates.dart';
import 'package:e_commerce/models/product_detailspid.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/detailspage/detailspage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class SubProductitem extends StatelessWidget {
  const SubProductitem({
    Key? key,
    required this.height,
    required this.productDetailsBypId,
    required this.index,
  }) : super(key: key);

  final double height;
  final ProductDetailsBypId productDetailsBypId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCartcubit, FavouriteCartStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        final isProductInWishlist = FavouriteCartcubit.get(context)
            .favouritesId
            .contains(productDetailsBypId.id.toString());
        print('pidddddd${productDetailsBypId.productId}');
        print('piccccccc${FavouriteCartcubit.get(context).favouritesId}');
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),

                        LikeButton(
                          isLiked: isProductInWishlist,
                          onTap: (isLiked) async {
                            print('itttttttttttt${productDetailsBypId.id}');
                            await FavouriteCartcubit.get(context)
                                .checkProductInWishlist(
                              context: context,
                              productdetailsid: productDetailsBypId.id,
                            );

                            return Future.value(!isLiked);
                          },
                          // likeBuilder: (isLiked) {
                          // return Icon(
                          //   isLiked
                          //       ? Icons.favorite
                          //       : Icons.favorite_border,
                          //   color: isLiked
                          //       ? Color(0xFFFF9800)
                          //       : Colors.grey,
                          // );
                          // },
                        )

                        // IconButton(
                        //     color: isProductInWishlist
                        //         ? Colors.red
                        //         : Colors.grey,
                        //     onPressed: () {
                        //       print(
                        //           'itttttttttttt${productDetailsBypId.id}');
                        //       FavouriteCartcubit.get(context)
                        //           .checkProductInWishlist(
                        //               context: context,
                        //               productdetailsid:
                        //                   productDetailsBypId.id);
                        //     },
                        //     icon: isProductInWishlist
                        //         ? Icon(Icons.favorite)
                        //         : const Icon(IconlyBroken.heart)),
                      ],
                    ),
                    Expanded(
                      child: Image(
                          image: NetworkImage(
                              '$baseimageurl${productDetailsBypId.productDetailImages[0].image}')),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    productDetailsBypId.productName,
                                    style: GoogleFonts.akayaKanadaka(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    )),
                                const SizedBox(height: 1),
                                Text('\$ ${productDetailsBypId.price}',
                                    style: const TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              context.push(DetailsPage(
                                productDetailId: productDetailsBypId.id,
                                index: index,
                                productid: productDetailsBypId.productId,

                                // pmodel: productDetailsBypId,
                              ));
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              color: AppColor.kmaincolor,
                              child: Image.asset('assets/images/forwar.png'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
