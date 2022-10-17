import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../global_members.dart';
import '../../../../../../network_connectivity_handler.dart';
import '../guide_tab_behavior.dart';

class GuideTabCategorySection extends StatefulWidget {
  const GuideTabCategorySection({Key? key}) : super(key: key);

  @override
  State<GuideTabCategorySection> createState() =>
      _GuideTabCategorySectionState();
}

class _GuideTabCategorySectionState extends State<GuideTabCategorySection>
    with GuideTabBehavior, ConnectivityHandler {
  Future<List<dynamic>> getCategoryResponseData() async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        categoryResponse = await dio.get(
          'https://insta-daleel.emicon.tech/api/get-categories/4',
          queryParameters: {
            'token': bearerToken,
          },
        );

        GuideTabBehavior.isCategoryResponseDataListFutureLoaded = true;

        categoryResponseMap = categoryResponse.data is Map<String, dynamic>
            ? categoryResponse.data
            : {};

        if (categoryResponseMap.isNotEmpty) {
          String status = categoryResponseMap['status'] is String
              ? categoryResponseMap['status']
              : '';
          if (status == 'success') {
            categoryDataList = categoryResponseMap['data'] is List<dynamic>
                ? categoryResponseMap['data']
                : [];
            return categoryDataList;
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
    if (!GuideTabBehavior.isCategoryResponseDataListFutureLoaded) {
      GuideTabBehavior.categoryResponseDataListFuture =
          getCategoryResponseData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GuideTabBehavior.categoryResponseDataListFuture,
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 145,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          return SizedBox(
            height: 145,
            child: ListView.builder(
              shrinkWrap: false,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  GuideTabCategorySectionCircularAvatar(
                iconLink: snapshot.data![index] is Map<String, dynamic>
                    ? snapshot.data![index]['icon'] is String
                        ? 'https://insta-daleel.emicon.tech/images/category/${snapshot.data![index]['icon']}'
                        : 'https://cdn-icons-png.flaticon.com/512/159/159469.png'
                    : 'https://cdn-icons-png.flaticon.com/512/159/159469.png',
                name: snapshot.data![index] is Map<String, dynamic>
                    ? snapshot.data![index]['name'] is String
                        ? snapshot.data![index]['name']
                        : '---'
                    : '---',
                onTap: () {
                  Navigator.pushNamed(context, 'SubCategories',
                      arguments: <String>[
                        snapshot.data![index] is Map<String, dynamic>
                            ? snapshot.data![index]['id'] is int
                                ? snapshot.data![index]['id'].toString()
                                : '---'
                            : '---',
                        snapshot.data![index] is Map<String, dynamic>
                            ? snapshot.data![index]['name'] is String
                                ? snapshot.data![index]['name']
                                : '---'
                            : '---',
                      ]);
                },
              ),
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
    );
  }
}

class GuideTabCategorySectionCircularAvatar extends StatelessWidget {
  const GuideTabCategorySectionCircularAvatar(
      {Key? key,
      required this.iconLink,
      required this.name,
      required this.onTap})
      : super(key: key);

  final String iconLink, name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(34, 168, 243, 1),
                  offset: Offset(2.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromRGBO(6, 122, 225, 0.79),
                  Color.fromRGBO(0, 175, 251, 0.79),
                ],
                stops: [
                  0.0,
                  1.0,
                ],
                tileMode: TileMode.mirror,
              ),
              // image: const DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage(
              //     'assets/images/main_page/home_page/guide_tab/guid_tab_guide_section_circular_avatar_background.png',
              //   ),
              // ),
            ),
            child: Center(
              child: CachedNetworkImage(
                height: 36,
                width: 36,
                fit: BoxFit.fill,
                imageUrl: iconLink,
                placeholder: (BuildContext context, String url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                    child: Icon(
                  Icons.error_outline_outlined,
                  color: Colors.black,
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            // color: Colors.red,
            width: 75,
            height: 45,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
