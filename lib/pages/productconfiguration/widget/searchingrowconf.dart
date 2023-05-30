import 'package:e_commerce/utilites/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchinRowConfig extends StatelessWidget {
  SearchinRowConfig({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: CustomTextFormField(
                hinnntcolr: Colors.grey.shade400,
                hintText: 'Search here ...',
                controller: _searchController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter the word search';
                  }
                  return null;
                },
              ),
            ),
          ),
          Container(
            color: const Color(0xff7EC042),
            height: 42,
            width: 40,
            child: SizedBox(
              height: 10,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: SvgPicture.asset(
                  color: Colors.white,
                  'assets/images/search.svg',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
//SvgPicture.asset(
            