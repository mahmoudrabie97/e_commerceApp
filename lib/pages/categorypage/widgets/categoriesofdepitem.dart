import 'package:e_commerce/models/categoriesofdepmodel.dart';
import 'package:e_commerce/network/endpoints.dart';
import 'package:e_commerce/pages/subProductPage/sub_products.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/dummydata.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:flutter/material.dart';

class CatofDitem extends StatelessWidget {
  const CatofDitem({
    super.key,
    required this.categoriesOfDepModel,
  });
  final CategoriesOfDepModel categoriesOfDepModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 200,
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
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/heart.png'),
                )
              ],
            ),
            Image(
                image:
                    NetworkImage('$baseimageurl${categoriesOfDepModel.image}')),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(categoriesOfDepModel.nameInEnglish ?? '',
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      Text('\$', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // context.push(
                      // DetailsPage(
                      // productModel: productModel
                      //));

                      context.push(SubProductPage(
                        productid: dummyproduct[0].productid,
                        productname: '',
                      ));
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      color: AppColor.kmaincolor,
                      child: Image.asset('assets/images/forwar.png'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


// class CatOfDepItem extends StatelessWidget {
//   const CatOfDepItem({
//     Key? key,
//     required this.categoriesOfDepModel,
//     //required this.productsofCatModel,
//   }) : super(key: key);

//   //final ProductsofCatModel productsofCatModel;
//   final CategoriesOfDepModel categoriesOfDepModel;

//   @override
//   Widget build(BuildContext context) {
//     print('object${categoriesOfDepModel.nameInEnglish ?? ''}');

//     return Expanded(
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 5, left: 5),
//             child: Container(
//               width: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(.5),
//                     spreadRadius: 3,
//                     blurRadius: 10,
//                     offset: const Offset(0, 3),
//                   )
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Image.asset('assets/images/heart.png'),
//                         )
//                       ],
//                     ),
//                     const Expanded(
//                       child: Image(
//                           image: NetworkImage(
//                               'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863')),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             children: [
//                               Text(categoriesOfDepModel.nameInEnglish ?? '',
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                   )),
//                               const SizedBox(height: 6),
//                               const Text('\$',
//                                   style: TextStyle(color: Colors.grey)),
//                             ],
//                           ),
//                         ),
//                         const Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             // context.push(
//                             // DetailsPage(
//                             // productModel: productModel
//                             //));

//                             context.push(SubProductPage(
//                               productid: dummyproduct[0].productid,
//                               productname: '',
//                             ));
//                           },
//                           child: Container(
//                             height: 25,
//                             width: 25,
//                             color: AppColor.kmaincolor,
//                             child: Image.asset('assets/images/forwar.png'),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
