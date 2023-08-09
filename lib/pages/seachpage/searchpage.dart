import 'package:e_commerce/pages/seachpage/widgets/customsearching.dart';
import 'package:e_commerce/utilites/custommethods.dart';
import 'package:e_commerce/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailspageappbar(
          context,
          CustomSearchingWidget(
            controller: _searchController,
            keyboardType: TextInputType.text,
            obscureText: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter the word search';
              }
              return null;
            },
            perfixicon: Icons.search,
          ),
          true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Last Search',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14),
                ),
                const Spacer(),
                const CustomText(
                  text: 'Clear all',
                  color: Colors.red,
                  fontSize: 12,
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const Row(
              children: [
                Icon(Icons.watch_later_outlined, color: Colors.grey),
                SizedBox(
                  width: 10,
                ),
                CustomText(
                    text: 'Iphone 12 pro max',
                    fontSize: 14,
                    color: Colors.grey),
                Spacer(),
                Icon(Icons.close, color: Colors.grey),
              ],
            )
          ],
        ),
      ),
    );
  }
}
