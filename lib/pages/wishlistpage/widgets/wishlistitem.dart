import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/models/favouritemodel.dart';

import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class WishListItem extends StatelessWidget {
  final FavouriteModel favouritemodel;

  const WishListItem({
    super.key,
    required this.favouritemodel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        children: [
          Image.network(
            '$baseimageurl${favouritemodel.productDetail!.productDetailImage![0].image}',
            fit: BoxFit.fill,
            width: 140,
          ),
          SizedBox(
            width: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            favouritemodel
                                    .productDetail!.productNameInEnglish ??
                                '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            print('removeeee id ${favouritemodel.id}');
                            FavouriteCartcubit.get(context)
                                .removeItemFromWishlist(
                                    context: context,
                                    productdetailsid:
                                        favouritemodel.productDetailId);
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  CustomText(
                      text: favouritemodel.productDetail!.oldPrice.toString(),
                      color: Colors.grey),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        CustomText(
                            text:
                                '\$ ${favouritemodel.productDetail!.price.toString()}'),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: (){
                              FavouriteCartcubit.get(context).addToCart(
                                  context: context,
                                  productdetailId: favouritemodel.productDetailId);
                            },
                            child: Image.asset(
                                'assets/images/add-to-cart (5) 2.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
