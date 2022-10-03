import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/get_specific_person_post_page/get_specific_person_post_behavior.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/community/community_tab_widgets/community_tab_small_card.dart';
import '../../../../../constants/colors.dart';
import '../../../../../global_members.dart';
import '../main_page/home_page/tabs/community/community_tab_widgets/community_tab_behavior.dart';
import '../main_page/home_page/tabs/community/community_tab_widgets/community_tab_large_card.dart';

class GetSpecificPersonPost extends StatefulWidget {
  const GetSpecificPersonPost({Key? key, required this.customerId})
      : super(key: key);

  static const String getSpecificPersonPostRoute = 'GetSpecificPersonPost';
  final int customerId;

  @override
  State<GetSpecificPersonPost> createState() => _GetSpecificPersonPostState();
}

class _GetSpecificPersonPostState extends State<GetSpecificPersonPost>
    with GetSpecificPersonPostBehavior, ConnectivityHandler {
  Future<List<dynamic>> getSpecificPersonPostResponseData(
      {int page = 1}) async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        getSpecificPersonPostResponse = await dio.get(
          '$baseUrl/api/get-post',
          queryParameters: {
            'token': bearerToken,
            'customer_id': widget.customerId,
            'page': page,
          },
        );

        getSpecificPersonPostResponseMap =
            getSpecificPersonPostResponse.data is Map<String, dynamic>
                ? getSpecificPersonPostResponse.data
                : {};

        if (getSpecificPersonPostResponseMap.isNotEmpty) {
          String status = getSpecificPersonPostResponseMap['status'] is String
              ? getSpecificPersonPostResponseMap['status']
              : '';
          if (status == 'success') {
            getSpecificPersonPostDataMap =
                getSpecificPersonPostResponseMap['data'] is Map<String, dynamic>
                    ? getSpecificPersonPostResponseMap['data']
                    : {};
            if (getSpecificPersonPostDataMap.isNotEmpty) {
              getSpecificPersonPostDataList =
                  getSpecificPersonPostDataMap['data'] is List<dynamic>
                      ? getSpecificPersonPostDataMap['data']
                      : [];
              return getSpecificPersonPostDataList;
            } else {
              return [];
            }
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
    CommunityTabBehavior.isFromCommunity = false;
    GetSpecificPersonPostBehavior.setStateOfSpecificPersonPostListView = () {
      GetSpecificPersonPostBehavior
              .getSpecificPersonPostResponseDataListFuture =
          getSpecificPersonPostResponseData();
      setState(() {});
    };
    GetSpecificPersonPostBehavior.getSpecificPersonPostResponseDataListFuture =
        getSpecificPersonPostResponseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // app bar
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    // HomePageProfilePic.setStateHomePageProfilePic();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(InstaDaleelColors.primaryColor),
                  ),
                ),
                title: const Center(
                  child: Text(
                    'Posts',
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
            // Search View
            Container(
              height: 55,
              margin: const EdgeInsets.symmetric(
                  horizontal: leftRightGlobalMargin, vertical: 15),
              decoration: BoxDecoration(
                  color: const Color(InstaDaleelColors.primaryColor),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        hintText: 'Search Here.....',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Image(
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/main_page/home_page/guide_tab/guide_tab_search_view_trailing_icon.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // divider
            const Divider(
              color: Colors.white,
              height: 20,
              thickness: 3,
            ),

            // refresh post
            InkWell(
              onTap: () {
                GetSpecificPersonPostBehavior
                    .setStateOfSpecificPersonPostListView();
              },
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.replay_circle_filled_rounded,
                      color: Color(InstaDaleelColors.primaryColor),
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Refresh',
                      style: TextStyle(
                          color: Color(InstaDaleelColors.primaryColor),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),

            // divider
            const Divider(
              color: Colors.white,
              height: 20,
              thickness: 3,
            ),

            FutureBuilder<List<dynamic>>(
              future: GetSpecificPersonPostBehavior
                  .getSpecificPersonPostResponseDataListFuture,
              initialData: const [],
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        )),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data!.isNotEmpty) {
                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            CommunityTabBehavior.isFromCommunity = false;
                            List<int> idsList = [];

                            idsList.add(snapshot.data![index]
                                    is Map<String, dynamic>
                                ? snapshot.data![index]['customer_id'] is int
                                    ? snapshot.data![index]['customer_id']
                                    : -1
                                : -1);

                            idsList.add(
                                snapshot.data![index] is Map<String, dynamic>
                                    ? snapshot.data![index]['id'] is int
                                        ? snapshot.data![index]['id']
                                        : -1
                                    : -1);

                            Navigator.pushNamed(context, 'PostDetailPage',
                                arguments: idsList);
                            // Navigator.pushNamed(context, 'BoxDetail', arguments: snapshot.data![index] is Map<String, dynamic>
                            //     ? snapshot.data![index]['id'] is int ? snapshot.data![index]['id'] : -1 : -1,);
                          },
                          child: snapshot.data![index]['image'] == null ||
                                  (jsonDecode(snapshot.data![index]['image']))
                                      .isEmpty
                              ? CommunityTabSmallCard(
                                  customerId: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_id']
                                              is int
                                          ? snapshot.data![index]['customer_id']
                                          : -1
                                      : -1,
                                  personName: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_data']
                                              is Map<String, dynamic>
                                          ? snapshot.data![index]
                                                      ['customer_data']['name']
                                                  is String
                                              ? snapshot.data![index]
                                                  ['customer_data']['name']
                                              : '---'
                                          : '---'
                                      : '---',
                                  postText: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['description']
                                              is String
                                          ? snapshot.data![index]['description']
                                          : '---'
                                      : '---',
                                  personProfilePicLink: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_data']
                                              is Map<String, dynamic>
                                          ? snapshot.data![index]
                                                      ['customer_data']['image']
                                                  is String
                                              ? '$baseUrl/images/customer/${snapshot.data![index]['customer_data']['image']}'
                                              : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                          : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                      : 'https://www.freeiconspng.com/uploads/profile-icon-1.png',
                                  likesCount: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['total_like']
                                              is int
                                          ? snapshot.data![index]['total_like']
                                          : -1
                                      : -1,
                                  likesIconData: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_data']
                                              is Map<String, dynamic>
                                          ? snapshot.data![index]
                                                  ['customer_data']['id'] is int
                                              ? snapshot.data![index]
                                                              ['customer_data']
                                                          ['id'] ==
                                                      userId
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_outlined
                                              : Icons.favorite_border_outlined
                                          : Icons.favorite_border_outlined
                                      : Icons.favorite_border_outlined,
                                  commentsCount: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['total_comment']
                                              is int
                                          ? snapshot.data![index]
                                              ['total_comment']
                                          : -1
                                      : -1,
                                )
                              : CommunityTabLargeCard(
                                  customerId: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_id']
                                              is int
                                          ? snapshot.data![index]['customer_id']
                                          : -1
                                      : -1,
                                  personName: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_data']
                                              is Map<String, dynamic>
                                          ? snapshot.data![index]
                                                      ['customer_data']['name']
                                                  is String
                                              ? snapshot.data![index]
                                                  ['customer_data']['name']
                                              : '---'
                                          : '---'
                                      : '---',
                                  postText: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['description']
                                              is String
                                          ? snapshot.data![index]['description']
                                          : '---'
                                      : '---',
                                  personProfilePicLink: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_data']
                                              is Map<String, dynamic>
                                          ? snapshot.data![index]
                                                      ['customer_data']['image']
                                                  is String
                                              ? '$baseUrl/images/customer/${snapshot.data![index]['customer_data']['image']}'
                                              : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                          : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                      : 'https://www.freeiconspng.com/uploads/profile-icon-1.png',
                                  likesCount: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['total_like']
                                              is int
                                          ? snapshot.data![index]['total_like']
                                          : -1
                                      : -1,
                                  likesIconData: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_data']
                                              is Map<String, dynamic>
                                          ? snapshot.data![index]
                                                  ['customer_data']['id'] is int
                                              ? snapshot.data![index]
                                                              ['customer_data']
                                                          ['id'] ==
                                                      userId
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_outlined
                                              : Icons.favorite_border_outlined
                                          : Icons.favorite_border_outlined
                                      : Icons.favorite_border_outlined,
                                  commentsCount: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['total_comment']
                                              is int
                                          ? snapshot.data![index]
                                              ['total_comment']
                                          : -1
                                      : -1,
                                  postFirstPicLink: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['image'] is String
                                          ? jsonDecode(snapshot.data![index]
                                                      ['image'])
                                                  .isNotEmpty
                                              ? '$baseUrl/images/post/${jsonDecode(snapshot.data![index]['image'])[0]['image']}'
                                              : 'https://bitsofco.de/content/images/2018/12/broken-1.png'
                                          : 'https://bitsofco.de/content/images/2018/12/broken-1.png'
                                      : 'https://bitsofco.de/content/images/2018/12/broken-1.png',
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: getSpecificPersonPostDataMap.isNotEmpty
                              ? getSpecificPersonPostDataMap['last_page'] is int
                                  ? getSpecificPersonPostDataMap['last_page']
                                  : 0
                              : 0,
                          itemBuilder: (context, index) {
                            int currentPageIndex = getSpecificPersonPostDataMap
                                    .isNotEmpty
                                ? getSpecificPersonPostDataMap['current_page']
                                        is int
                                    ? getSpecificPersonPostDataMap[
                                        'current_page']
                                    : 0
                                : 0;
                            return IconButton(
                              icon: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: const Color(
                                      InstaDaleelColors.primaryColor),
                                  fontWeight: (index + 1) == currentPageIndex
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize:
                                      (index + 1) == currentPageIndex ? 20 : 14,
                                ),
                              ),
                              onPressed: () {
                                setState(() {});
                                GetSpecificPersonPostBehavior
                                        .getSpecificPersonPostResponseDataListFuture =
                                    getSpecificPersonPostResponseData(
                                        page: index + 1);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text(
                      'no post here',
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*CachedNetworkImage(
                            height: 30,
                            width: 30,
                            fit: BoxFit.contain,
                            imageUrl: snapshot.data![index] is Map<String, dynamic>
                                ? snapshot.data![index]['image'] is String
                                ? snapshot.data![index]['image']
                                : 'https://cdn-icons-png.flaticon.com/512/159/159469.png'
                                : 'https://cdn-icons-png.flaticon.com/512/159/159469.png',
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
                          ),*/