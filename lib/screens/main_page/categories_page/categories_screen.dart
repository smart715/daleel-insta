import 'package:flutter/material.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import '../../../constants/colors.dart';
import '../../../global_members.dart';
import '../../../widgets/category_card.dart';
import '../../sub_category_page/sub_category_ui.dart';
import 'categories_behavior.dart';


class CategoriesPageNavigator extends StatefulWidget {
  const CategoriesPageNavigator({Key? key}) : super(key: key);

  @override
  State<CategoriesPageNavigator> createState() => _CategoriesPageNavigatorState();
}

class _CategoriesPageNavigatorState extends State<CategoriesPageNavigator> {
  @override
  Widget build(BuildContext context) {
    return
      Navigator(
        initialRoute: AllCategories.allCategoriesRoute,
        onGenerateRoute: (settings) {
          switch(settings.name) {
            case AllCategories.allCategoriesRoute: {
              return MaterialPageRoute(builder: (context) {
                return const AllCategories();
              },);
            }
            case SubCategories.subCategoriesRoute: {
              List<String> argumentList = settings.arguments as List<String>;
              return MaterialPageRoute(builder: (context) => SubCategories(
                categoryId: argumentList[0],
                categoryName: argumentList[1],
              ),);
            }
            default: {
              return MaterialPageRoute(builder: (context) => const Center(child: Text('Default Screen'),),);
            }
          }
        },
      );
  }
}


class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  static const String allCategoriesRoute = 'AllCategories';

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> with AllCategoryBehavior, ConnectivityHandler {

  Future<List<dynamic>> getAllCategoriesResponseData() async {
    if(await checkForInternetServiceAvailability(context)) {
      try {
        allCategoryResponse = await dio.get('https://insta-daleel.emicon.tech/api/get-categories/All', queryParameters: {
          'token': bearerToken,
        },);

        AllCategoryBehavior.isAllCategoryResponseDataMapFutureLoaded = true;

        allCategoryResponseMap = allCategoryResponse.data is Map<String, dynamic> ? allCategoryResponse.data : {};

        if(allCategoryResponseMap.isNotEmpty) {
          String status = allCategoryResponseMap['status'] is String ? allCategoryResponseMap['status'] : '';
          if(status == 'success') {
            allCategoryDataList = allCategoryResponseMap['data'] is List<dynamic> ? allCategoryResponseMap['data'] : [];
            AllCategoryBehavior.allCategoryResponseDataBackupList.clear();
            AllCategoryBehavior.allCategoryResponseDataFilteredList.clear();
            AllCategoryBehavior.allCategoryResponseDataBackupList.addAll(allCategoryDataList);
            AllCategoryBehavior.allCategoryResponseDataFilteredList.addAll(allCategoryDataList);
            return allCategoryDataList;
          }
          else {
            return [];
          }
        }
        else {
          return [];
        }
      }
      catch(e) {
        return [];
      }
    }
    else {
      return [];
    }
  }

  @override
  void initState() {
    if(!AllCategoryBehavior.isAllCategoryResponseDataMapFutureLoaded) {
      AllCategoryBehavior.allCategoryResponseDataListFuture = getAllCategoriesResponseData();
    }
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
                  'All Categories',
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
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        // controller: textEditingController,
                        onChanged: (searchedText) {
                          AllCategoryBehavior.allCategoryResponseDataFilteredList.clear();
                          searchedText = searchedText.trim();
                          if(searchedText.isNotEmpty) {
                            for(var item in AllCategoryBehavior.allCategoryResponseDataBackupList) {
                              String categoryName = item is Map<String, dynamic> ?
                              item['name'] is String ?
                              item['name']
                                  :
                              '---'
                                  :
                              '---';
                              if(categoryName.toLowerCase().contains(searchedText.toLowerCase())) {
                                AllCategoryBehavior.allCategoryResponseDataFilteredList.add(item);
                                setState(() {});
                              }
                              else {
                                setState(() {});
                              }
                            }
                          }
                          else {
                            AllCategoryBehavior.allCategoryResponseDataFilteredList.addAll(AllCategoryBehavior.allCategoryResponseDataBackupList);
                            setState(() {});
                          }
                        },
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                            hintText: 'Search Here',
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
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: VerticalDivider(
                      color: Color(0xFFB1B1B1),
                      thickness: 0.5,
                      indent: 8,
                      endIndent: 8,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(right: 20, left: 10),
                      child: Image(
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                        color: Color(InstaDaleelColors.primaryColor),
                        image: AssetImage(
                            'assets/images/main_page/bottom_navigation_bar/search.png'
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
          // body
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FutureBuilder(
                  future: AllCategoryBehavior.allCategoryResponseDataListFuture,
                  initialData: const [],
                  builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: AllCategoryBehavior.allCategoryResponseDataFilteredList.length,
                        itemBuilder: (context, index) => CategoryCard(
                          onTap: (){
                            Navigator.pushNamed(context, 'SubCategories', arguments: <String>[
                              AllCategoryBehavior.allCategoryResponseDataFilteredList[index] is Map<String, dynamic> ?
                              AllCategoryBehavior.allCategoryResponseDataFilteredList[index]['id'] is int ?
                              AllCategoryBehavior.allCategoryResponseDataFilteredList[index]['id'].toString() : '---' : '---',
                              AllCategoryBehavior.allCategoryResponseDataFilteredList[index] is Map<String, dynamic> ?
                              AllCategoryBehavior.allCategoryResponseDataFilteredList[index]['name'] is String ?
                              AllCategoryBehavior.allCategoryResponseDataFilteredList[index]['name'] : '---' : '---',
                            ]);
                          },
                          title: AllCategoryBehavior.allCategoryResponseDataFilteredList[index] is Map<String, dynamic> ?
                          AllCategoryBehavior.allCategoryResponseDataFilteredList[index]['name'] is String ?
                          AllCategoryBehavior.allCategoryResponseDataFilteredList[index]['name'] : '---' : '---',
                          imageLink: AllCategoryBehavior.allCategoryResponseDataFilteredList[index] is Map<String, dynamic> ?
                          AllCategoryBehavior.allCategoryResponseDataFilteredList[index]['icon'] is String ?
                          'https://insta-daleel.emicon.tech/images/category/${AllCategoryBehavior.allCategoryResponseDataFilteredList[index]['icon']}' :
                          'https://cdn-icons-png.flaticon.com/512/159/159469.png'
                              :
                          'https://cdn-icons-png.flaticon.com/512/159/159469.png',
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.6,
                        ),
                      );
                    }
                    else {
                      return const Center(
                        child: Text(
                          'no category available',
                        ),
                      );
                    }
                  },
                )
            ),
          ),
        ],
      ),
    );
  }
}
