import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/main_page/categories_page/categories_behavior.dart';
import 'package:insta_daleel/screens/main_page/search_widget.dart';
import '../../../constants/colors.dart';
import '../../../global_members.dart';
import '../../../widgets/category_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const String searchPageRoute = 'SearchPage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AllCategoryBehavior, ConnectivityHandler {
  bool filterListIsOpen = false;
  Set<String> selectedFilters = HashSet();
  List<String> filterList = [
    'Mobile',
    'Television',
    'Monitor',
    'VR Set',
    'Headset',
    'A/C',
    'Fridge',
    'Microwave',
    'UPS',
    'Modem',
  ];
  Future<List<dynamic>> getAllCategoriesResponseData() async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        allCategoryResponse = await dio.get(
          'https://insta-daleel.emicon.tech/api/get-categories/All',
          queryParameters: {
            'token': bearerToken,
          },
        );

        AllCategoryBehavior.isAllCategoryResponseDataMapFutureLoaded = true;

        allCategoryResponseMap =
            allCategoryResponse.data is Map<String, dynamic>
                ? allCategoryResponse.data
                : {};

        if (allCategoryResponseMap.isNotEmpty) {
          String status = allCategoryResponseMap['status'] is String
              ? allCategoryResponseMap['status']
              : '';
          if (status == 'success') {
            allCategoryDataList =
                allCategoryResponseMap['data'] is List<dynamic>
                    ? allCategoryResponseMap['data']
                    : [];
            AllCategoryBehavior.allCategoryResponseDataBackupList.clear();
            AllCategoryBehavior.allCategoryResponseDataFilteredList.clear();
            AllCategoryBehavior.allCategoryResponseDataBackupList
                .addAll(allCategoryDataList);
            AllCategoryBehavior.allCategoryResponseDataFilteredList
                .addAll(allCategoryDataList);
            return allCategoryDataList;
          } else {
            return [];
          }
        } else {
          return [];
        }
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }

  @override
  void initState() {
    if (!AllCategoryBehavior.isAllCategoryResponseDataMapFutureLoaded) {
      AllCategoryBehavior.allCategoryResponseDataListFuture =
          getAllCategoriesResponseData();
    }
    super.initState();
  }

  Widget _toWrapWidget(String val) {
    bool isSelected = selectedFilters.contains(val);
    return InkWell(
      onTap: (() {
        bool successful = selectedFilters.add(val);
        if (successful) {
          setState(() {});
        } else {
          successful = selectedFilters.remove(val);
          if (successful) {
            setState(() {});
          }
        }
      }),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isSelected
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/main_page/featured_page/sbb.png'),
                  ),
                ),
                child: Text(
                  val,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                child: Text(
                  val,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(38, 50, 56, 0.6),
                  ),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: Column(
        children: [
          //app bar
          SizedBox(
            height: 70,
            // width: MediaQuery.of(context).size.width,
            child: ListTile(
              leading: Visibility(
                visible: false,
                child: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(InstaDaleelColors.primaryColor),
                  ),
                ),
              ),
              title: const Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: Color(InstaDaleelColors.primaryColor),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              trailing: SizedBox(
                height: 45,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(15),
                  child: const Image(
                    height: 25,
                    width: 25,
                    fit: BoxFit.contain,
                    image: AssetImage(
                        'assets/images/main_page/app_bar/main_screen_appbar_help_info_icon.png'),
                  ),
                ),
              ),
            ),
          ),
          //search view
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SearchWidget(
                  onChanged: (searchedText) {
                    AllCategoryBehavior.allCategoryResponseDataFilteredList
                        .clear();
                    searchedText = searchedText.trim();
                    if (searchedText.isNotEmpty) {
                      for (var item in AllCategoryBehavior
                          .allCategoryResponseDataBackupList) {
                        String categoryName = item is Map<String, dynamic>
                            ? item['name'] is String
                                ? item['name']
                                : '---'
                            : '---';
                        if (categoryName
                            .toLowerCase()
                            .contains(searchedText.toLowerCase())) {
                          AllCategoryBehavior
                              .allCategoryResponseDataFilteredList
                              .add(item);
                          setState(() {});
                        } else {
                          setState(() {});
                        }
                      }
                    } else {
                      AllCategoryBehavior.allCategoryResponseDataFilteredList
                          .addAll(AllCategoryBehavior
                              .allCategoryResponseDataBackupList);
                      setState(() {});
                    }
                  },
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      filterListIsOpen = !filterListIsOpen;
                    });
                  },
                  child: (!filterListIsOpen)
                      ? Container(
                          height: 47,
                          width: 47,
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                offset: Offset(0, 1),
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/main_page/featured_page/f.png',
                              fit: BoxFit.contain,
                              width: 21,
                              height: 21,
                              color:
                                  const Color(InstaDaleelColors.primaryColor),
                            ),
                          ),
                        )
                      : Container(
                          height: 47,
                          width: 47,
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                offset: Offset(0, 1),
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/main_page/featured_page/sf.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/main_page/featured_page/f.png',
                              fit: BoxFit.contain,
                              width: 21,
                              height: 21,
                            ),
                          ),
                        ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: (filterListIsOpen)
                  ? Wrap(
                      spacing: 4.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children:
                          filterList.map((e) => _toWrapWidget(e)).toList(),
                    )
                  : Container(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // body
          Expanded(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: FutureBuilder(
                  future: AllCategoryBehavior.allCategoryResponseDataListFuture,
                  initialData: const [],
                  builder: (BuildContext context,
                      AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.hasData &&
                        snapshot.data!.isNotEmpty) {
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: AllCategoryBehavior
                            .allCategoryResponseDataFilteredList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.8,
                        ),
                        itemBuilder: (context, index) => CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(context, 'SubCategories',
                                arguments: <String>[
                                  AllCategoryBehavior
                                              .allCategoryResponseDataFilteredList[
                                          index] is Map<String, dynamic>
                                      ? AllCategoryBehavior
                                                  .allCategoryResponseDataFilteredList[
                                              index]['id'] is int
                                          ? AllCategoryBehavior
                                              .allCategoryResponseDataFilteredList[
                                                  index]['id']
                                              .toString()
                                          : '---'
                                      : '---',
                                  AllCategoryBehavior
                                              .allCategoryResponseDataFilteredList[
                                          index] is Map<String, dynamic>
                                      ? AllCategoryBehavior
                                                  .allCategoryResponseDataFilteredList[
                                              index]['name'] is String
                                          ? AllCategoryBehavior
                                                  .allCategoryResponseDataFilteredList[
                                              index]['name']
                                          : '---'
                                      : '---',
                                ]);
                          },
                          title: AllCategoryBehavior
                                      .allCategoryResponseDataFilteredList[
                                  index] is Map<String, dynamic>
                              ? AllCategoryBehavior
                                          .allCategoryResponseDataFilteredList[
                                      index]['name'] is String
                                  ? AllCategoryBehavior
                                          .allCategoryResponseDataFilteredList[
                                      index]['name']
                                  : '---'
                              : '---',
                          imageLink: AllCategoryBehavior
                                      .allCategoryResponseDataFilteredList[
                                  index] is Map<String, dynamic>
                              ? AllCategoryBehavior
                                          .allCategoryResponseDataFilteredList[
                                      index]['icon'] is String
                                  ? 'https://insta-daleel.emicon.tech/images/category/${AllCategoryBehavior.allCategoryResponseDataFilteredList[index]['icon']}'
                                  : 'https://cdn-icons-png.flaticon.com/512/159/159469.png'
                              : 'https://cdn-icons-png.flaticon.com/512/159/159469.png',
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'no category available',
                        ),
                      );
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
