import 'package:e_commerce/pages/detailspage/widgets/addingtocartrow.dart';
import 'package:e_commerce/pages/detailspage/widgets/choosingcolor.dart';
import 'package:e_commerce/pages/detailspage/widgets/detailspricerow.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/productmodel.dart';

class DetailsPage extends StatelessWidget {
  final ProductModel productModel;

  const DetailsPage({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailspageappbar(
        context,
        const Text(
          'Details Product',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image(
                  width: 400,
                  image: AssetImage(productModel.productimage),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DetailsPriceRow(productModel: productModel),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 7),
                child: CustomText(
                  text: 'Choose the color',
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const ChoosingColorsWidget(),
              const CustomText(
                text: 'Description of product',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: CustomText(
                    text: productModel.description,
                    fontSize: 12,
                    color: const Color(0xff393F42)),
              ),
              const SizedBox(
                height: 20,
              ),
              const AddingToCartRow(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
