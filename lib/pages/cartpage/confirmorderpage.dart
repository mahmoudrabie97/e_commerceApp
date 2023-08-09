import 'package:e_commerce/pages/cartpage/myorderspage.dart';
import 'package:e_commerce/utilites/appcolors.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/custombutton.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:e_commerce/utilites/widgets/customtextfieldm.dart';

import 'package:e_commerce/utilites/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';

final List<String> paymentoptions = [
  'Cash on delivery',
  'PayPal',
];

class ConfirmOrderPage extends StatefulWidget {
  const ConfirmOrderPage({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _ordernotescontrolle = TextEditingController();
  final TextEditingController _zipcontroller = TextEditingController();

  final countrylist = ['country1', 'country2', 'country3', 'country4'];
  final citylist = ['city1', 'city2', 'city3', 'city4'];
  final statelist = ['state1', 'state2', 'state3', 'state5'];

  String? country;
  String? city;
  String? state;

  String currentoption = paymentoptions[0];
  DropdownMenuItem<String> buildCountryMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontSize: 12),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: detailspageappbar(
          context,
          const Text(' Confirm Order',
              style: TextStyle(color: Colors.black, fontSize: 14)),
          false,
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomTextFormField(
                    controller: _addresscontroller,
                    hintText: 'Address',
                    hinnntcolr: Colors.grey,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'text must not be null';
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: CustomText(text: 'Adress Type'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addressitem(
                        containercolor: AppColor.kmaincolor,
                        text: 'Email',
                        textcolor: Colors.white),
                    addressitem(
                        containercolor: Colors.white,
                        text: 'Work',
                        textcolor: AppColor.kmaincolor),
                    addressitem(
                        containercolor: Colors.white,
                        text: 'Other',
                        textcolor: AppColor.kmaincolor),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    countryItem(countrylist: countrylist),
                    cityItem(countrylist: citylist),
                    stateItem(countrylist: statelist)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CustomText(text: 'Zip'),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomTextFormField(
                    controller: _zipcontroller,
                    hintText: 'zip',
                    hinnntcolr: Colors.grey,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'text must not be null';
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: CustomText(text: 'Order Notes (Optional) '),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: CustomTextField(
                      controller: _ordernotescontrolle,
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                  width: 50, child: CustomText(text: 'Payment Method')),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Container(
                  height: 200.0,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      RadioListTile(
                          activeColor: Colors.black,
                          title: Text('Cash on delivery'),
                          value: paymentoptions[0],
                          groupValue: currentoption,
                          onChanged: (val) {
                            setState(() {
                              currentoption = val.toString();
                            });
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Center(
                                child: Text('Pay with cash upon delivery')),
                          ),
                        ),
                      ),
                      RadioListTile(
                          activeColor: Colors.black,
                          title: Text('PayPal  '),
                          value: paymentoptions[1],
                          groupValue: currentoption,
                          onChanged: ((val) {
                            setState(() {
                              currentoption = val.toString();
                            });
                          })),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                  buttonText: 'Place Order',
                  onPressed: () {
                    context.push(MyOrdersPage());
                  },
                  borderRadius: 10),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ));
  }

  Widget addressitem(
      {required Color containercolor,
      required String text,
      required Color textcolor}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 7),
      child: Container(
        height: 45.0,
        width: 90,
        decoration: BoxDecoration(
          color: containercolor,
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(color: AppColor.kmaincolor),
        ),
        child: Center(
            child: CustomText(
          text: text,
          color: textcolor,
        )),
      ),
    );
  }

  Expanded countryItem({required List<String> countrylist}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                value: country,
                isExpanded: true,
                iconSize: 30,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                items: countrylist.map(buildCountryMenuItem).toList(),
                onChanged: (value) {
                  setState(() {
                    this.country = value;
                  });
                }),
          ),
        ),
      ),
    );
  }

  Expanded cityItem({required List<String> countrylist}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                value: city,
                isExpanded: true,
                iconSize: 30,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                items: countrylist.map(buildCountryMenuItem).toList(),
                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                }),
          ),
        ),
      ),
    );
  }

  Expanded stateItem({required List<String> countrylist}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                value: state,
                isExpanded: true,
                iconSize: 30,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                items: countrylist.map(buildCountryMenuItem).toList(),
                onChanged: (value) {
                  setState(() {
                    state = value;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
