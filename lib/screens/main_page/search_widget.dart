import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.onChanged,
  });
  final Function(String word) onChanged;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 2),
              color: Color.fromARGB(17, 0, 0, 0),
            )
          ]),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextField(
                textInputAction: TextInputAction.next,
                onChanged: (value) => widget.onChanged(value),
                // controller: textEditingController,
                // onChanged: (searchedText) {
                //   AllCategoryBehavior.allCategoryResponseDataFilteredList
                //       .clear();
                //   searchedText = searchedText.trim();
                //   if (searchedText.isNotEmpty) {
                //     for (var item in AllCategoryBehavior
                //         .allCategoryResponseDataBackupList) {
                //       String categoryName = item is Map<String, dynamic>
                //           ? item['name'] is String
                //               ? item['name']
                //               : '---'
                //           : '---';
                //       if (categoryName
                //           .toLowerCase()
                //           .contains(searchedText.toLowerCase())) {
                //         AllCategoryBehavior.allCategoryResponseDataFilteredList
                //             .add(item);
                //         setState(() {});
                //       } else {
                //         setState(() {});
                //       }
                //     }
                //   } else {
                //     AllCategoryBehavior.allCategoryResponseDataFilteredList
                //         .addAll(AllCategoryBehavior
                //             .allCategoryResponseDataBackupList);
                //     setState(() {});
                //   }
                // },
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                    hintText: 'Search Here....',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(
                      color: Color(0xFFB1B1B1),
                      fontSize: 13,
                    ),
                    border: InputBorder.none),
                cursorColor: const Color(InstaDaleelColors.primaryColor),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: const VerticalDivider(
              color: Color(0xFFB1B1B1),
              thickness: 0.5,
              indent: 8,
              endIndent: 8,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(right: 20, left: 10),
              child: Image(
                height: 23,
                width: 23,
                fit: BoxFit.fill,
                color: Color(InstaDaleelColors.primaryColor),
                image: AssetImage(
                    'assets/images/main_page/bottom_navigation_bar/search.png'),
              )),
        ],
      ),
    );
  }
}
