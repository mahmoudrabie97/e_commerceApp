import 'package:e_commerce/cubit/favouritecartcubit/favouritecartcubit.dart';
import 'package:e_commerce/cubit/homecubit/homecubit.dart';
import 'package:e_commerce/cubit/productcubit/productcubit.dart';
import 'package:e_commerce/models/checkedcartmodel.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/detailspage/widgets/addingtocartrow.dart';
import 'package:e_commerce/pages/detailspage/widgets/detailspricerow.dart';
import 'package:e_commerce/pages/detailspage/widgets/mostviewproductuser.dart';
import 'package:e_commerce/pages/detailspage/widgets/subproductdetail.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.productDetailId,
    required this.index,
    required this.productid,
    // required this.pmodel,
  }) : super(key: key);
  final int productDetailId;
  //final ProductDetailsBypId pmodel;
  final int index;
  final int productid;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    ProductCubit.get(context).getSimilarProduct(
        productDetailId: widget.productDetailId,
        productId: widget.productid,
        context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductCubit.get(context).getProductdetailsbyByProductDetailId;

    print('iddddddddddddddddd${widget.productDetailId}');
    FavouriteCartcubit.get(context).addMostViewed(
        context: context, productdetailsid: widget.productDetailId);
    FavouriteCartcubit.get(context).getMostviewProductUser(context: context);
    double itemWidth = context.screenwidth * 0.4;
    double itemHeight = itemWidth / 0.8;
    //ProductCubit.get(context)
    //    .getProductdetailsbyproductId(productid: productid, context: context);
    return Scaffold(
      appBar: detailspageappbar(
        context,
        const Text(
          'Details Product',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        true,
      ),
      body: FutureBuilder(
        future: ProductCubit.get(context).getProductdetailsbyByProductDetailId(
            productDetailId: widget.productDetailId, context: context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            //final List<ProductDetailsBypId> filteredList =
            //  ProductCubit.get(context)
            //    .productdetailsbyidList
            //  .where((item) => item.id != widget.productDetailId)
            //.toList();
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Image(
                          width: 400,
                          image: NetworkImage(
                              '$baseimageurl${ProductCubit.get(context).getProductDetailsByProductDetailIdList[0].productDetailImages[0].image}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DetailsPriceRow(
                        productname: ProductCubit.get(context)
                            .productdetailsbyidList[widget.index]
                            .categoryName,
                        price: ProductCubit.get(context)
                            .productdetailsbyidList[widget.index]
                            .price,
                        productdetailsid: widget.productDetailId,
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      const CustomText(
                        text: 'Description ',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: CustomText(
                            text: ProductCubit.get(context)
                                    .getProductDetailsByProductDetailIdList[0]
                                    .productDetailImages[0]
                                    .productDetail ??
                                'No description added For this product  ',
                            fontSize: 12,
                            color: const Color(0xff393F42)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AddingToCartRow(
                        productdetailId: widget.productDetailId,

                        // pmodel: pmodel,
                        // cartModel: FavouriteCartcubit.get(context)
                        //   .showcartItemsList[index],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        // margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const CustomText(
                          text: 'Browse similar products interesting',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: ProductCubit.get(context)
                              .getSimilarProductList
                              .length,
                          itemExtent:
                              itemHeight - 30, // تعديل ارتفاع العنصر الفرعي
                          itemBuilder: (context, index) {
                            return SubProductDetailItm(
                              productDetailsBypId: ProductCubit.get(context)
                                  .getSimilarProductList[index],
                              index: index,
                              height: 300,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        // margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const CustomText(
                          text: 'Most Viewed',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        child: FavouriteCartcubit.get(context)
                                .getMostProductViewedList
                                .isEmpty
                            ? const Center(
                                child: Text('nooo mostviewed visted yet '),
                              )
                            : GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                childAspectRatio: (itemWidth / itemHeight),
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                padding: const EdgeInsets.all(10),
                                children: List.generate(
                                    FavouriteCartcubit.get(context)
                                        .getMostProductViewedList
                                        .length, (index) {
                                  return MostVistedProductUserItem(
                                    height: itemHeight - 30,
                                    mostViewedmodel: HomeCubit.get(context)
                                        .getMostViewedList[index],
                                  );
                                }),
                              ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
