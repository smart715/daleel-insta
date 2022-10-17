import 'package:flutter/material.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/main_page/search_widget.dart';
import 'package:insta_daleel/screens/sub_category_page/sub_category_behavior.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';
import '../../widgets/category_card.dart';

class SubCategories extends StatefulWidget {
  const SubCategories(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  static const String subCategoriesRoute = 'SubCategories';

  final String categoryId, categoryName;

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories>
    with SubCategoryBehavior, ConnectivityHandler {
  Future<List<dynamic>> getSubCategoriesResponseData() async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        subCategoryResponse = await dio.get(
          'https://insta-daleel.emicon.tech/api/get-sub-categories/${widget.categoryId}',
          queryParameters: {
            'token': bearerToken,
          },
        );

        subCategoryResponseMap =
            subCategoryResponse.data is Map<String, dynamic>
                ? subCategoryResponse.data
                : {};

        if (subCategoryResponseMap.isNotEmpty) {
          String status = subCategoryResponseMap['status'] is String
              ? subCategoryResponseMap['status']
              : '';
          if (status == 'success') {
            subCategoryDataList =
                subCategoryResponseMap['data'] is List<dynamic>
                    ? subCategoryResponseMap['data']
                    : [];
            SubCategoryBehavior.subCategoryResponseDataBackupList.clear();
            SubCategoryBehavior.subCategoryResponseDataFilteredList.clear();
            SubCategoryBehavior.subCategoryResponseDataBackupList
                .addAll(subCategoryDataList);
            SubCategoryBehavior.subCategoryResponseDataFilteredList
                .addAll(subCategoryDataList);
            return subCategoryDataList;
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
    SubCategoryBehavior.subCategoryResponseDataListFuture =
        getSubCategoriesResponseData();
    super.initState();
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
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(InstaDaleelColors.primaryColor),
                ),
              ),
              title: Center(
                child: Text(
                  widget.categoryName,
                  style: const TextStyle(
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
          SearchWidget(
            onChanged: (searchedText) {
              SubCategoryBehavior.subCategoryResponseDataFilteredList.clear();
              searchedText = searchedText.trim();
              if (searchedText.isNotEmpty) {
                for (var item
                    in SubCategoryBehavior.subCategoryResponseDataBackupList) {
                  String categoryName = item is Map<String, dynamic>
                      ? item['name'] is String
                          ? item['name']
                          : '---'
                      : '---';
                  if (categoryName
                      .toLowerCase()
                      .contains(searchedText.toLowerCase())) {
                    SubCategoryBehavior.subCategoryResponseDataFilteredList
                        .add(item);
                    setState(() {});
                  } else {
                    setState(() {});
                  }
                }
              } else {
                SubCategoryBehavior.subCategoryResponseDataFilteredList.addAll(
                    SubCategoryBehavior.subCategoryResponseDataBackupList);
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),

          // body
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FutureBuilder(
                  future: SubCategoryBehavior.subCategoryResponseDataListFuture,
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
                        itemCount: SubCategoryBehavior
                            .subCategoryResponseDataFilteredList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.8,
                        ),
                        itemBuilder: (context, index) => CategoryCard(
                          onTap: () {},
                          title: SubCategoryBehavior
                                      .subCategoryResponseDataFilteredList[
                                  index] is Map<String, dynamic>
                              ? SubCategoryBehavior
                                          .subCategoryResponseDataFilteredList[
                                      index]['name'] is String
                                  ? SubCategoryBehavior
                                          .subCategoryResponseDataFilteredList[
                                      index]['name']
                                  : '---'
                              : '---',
                          imageLink: SubCategoryBehavior
                                      .subCategoryResponseDataFilteredList[
                                  index] is Map<String, dynamic>
                              ? SubCategoryBehavior
                                          .subCategoryResponseDataFilteredList[
                                      index]['icon'] is String
                                  ? 'https://insta-daleel.emicon.tech/images/category/${SubCategoryBehavior.subCategoryResponseDataFilteredList[index]['icon']}'
                                  : 'https://cdn-icons-png.flaticon.com/512/159/159469.png'
                              : 'https://cdn-icons-png.flaticon.com/512/159/159469.png',
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'no sub category available',
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
