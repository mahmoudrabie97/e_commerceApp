import 'package:e_commerce/utilites/extentionhelper.dart';
import 'package:e_commerce/utilites/widgets/customtextformfield.dart';
import 'package:flutter/material.dart';

class SearchingitemRow extends StatelessWidget {
  const SearchingitemRow({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        SizedBox(
          width: context.screenwidth * 0.07,
        ),
        Image(
          image: AssetImage('assets/images/Buy1.png'),
          width: context.screenwidth * 0.08,
          height: context.screenwidth * 0.08,
        ),
      ],
    );
  }
}
