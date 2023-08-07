import 'package:e_commerce/models/productmodel.dart';
import 'package:flutter/material.dart';

final List<String> dummynames = [
  'Medical Masks',
  'Medical Devices',
  'Surgical tools',
  'Medical pumps',
  'All',
];

final List dummyicons = [
  Image.asset(
    'assets/images/fashion.jpg',
    height: 60,
  ),
  Image.asset('assets/images/fashion2.png', height: 60),
  Image.asset(
    'assets/images/fashion3.png',
    height: 60,
  ),
  Image.asset(
    'assets/images/fashion4.jpg',
    height: 60,
  ),
  Image.asset(
    'assets/images/Category1.png',
    height: 60,
  ),
];
final List<ProductModel> dummyproduct = [
  ProductModel(
    productid: 1,
    productimage: 'assets/images/medical 1.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description:
        'd1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet arcu id tincidunt tellus arcu rhoncus, turpis nisl sed. Neque viverra ipsum orci, morbi semper. Nulla bibendum purus tempor semper purus. Ut curabitur platea sed blandit. Amet non at proin justo nulla et. A, blandit morbi suspendisse vel malesuada purus massa mi. Faucibus neque a mi hendrerit.',
  ),
  ProductModel(
    productid: 2,
    productimage: 'assets/images/OPTO-EDU.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description:
        'd2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet arcu id tincidunt tellus arcu rhoncus, turpis nisl sed. Neque viverra ipsum orci, morbi semper. Nulla bibendum purus tempor semper purus. Ut curabitur platea sed blandit. Amet non at proin justo nulla et. A, blandit morbi suspendisse vel malesuada purus massa mi. Faucibus neque a mi hendrerit.',
  ),
  ProductModel(
    productid: 3,
    productimage: 'assets/images/OPTO-EDU.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description: 'd3',
  ),
  ProductModel(
    productid: 4,
    productimage: 'assets/images/medical 1.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description: 'd4',
  ),
  ProductModel(
    productid: 5,
    productimage: 'assets/images/medical 1.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description: 'd5',
  ),
  ProductModel(
    productid: 6,
    productimage: 'assets/images/medical 1.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description: 'd6',
  ),
  ProductModel(
    productid: 7,
    productimage: 'assets/images/medical 1.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description: 'd7',
  ),
  ProductModel(
    productid: 8,
    productimage: 'assets/images/medical 1.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description: 'd8',
  ),
  ProductModel(
    productid: 9,
    productimage: 'assets/images/medical 1.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description: 'd9',
  ),
  ProductModel(
    productid: 10,
    productimage: 'assets/images/medical 1.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description: 'd10',
  ),
  ProductModel(
    productid: 11,
    productimage: 'assets/images/medical 1.png',
    producttitle: 'Medical Device',
    productprice: 30,
    description: 'd11',
  ),
];
final List<Color> productColors = [
  const Color(0xff7EC042),
  const Color(0xffEB996E),
  const Color(0xffD65B5B),
  const Color(0xff582FFF),
  const Color(0xffFFBE9D),
  const Color(0xff484C52),
  const Color(0xffD1EBFF),
];
