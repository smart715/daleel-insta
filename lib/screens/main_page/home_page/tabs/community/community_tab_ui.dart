import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/community/community_tab_widgets/community_tab_behavior.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/community/community_tab_widgets/community_tab_small_card.dart';
import '../../../../../constants/colors.dart';
import '../../../../../global_members.dart';

class CommunityTab extends StatefulWidget {
  const CommunityTab({Key? key}) : super(key: key);

  @override
  State<CommunityTab> createState() => _CommunityTabState();
}

class _CommunityTabState extends State<CommunityTab>
    with CommunityTabBehavior, ConnectivityHandler {
  Future<List<dynamic>> getLatestPostResponseData({int page = 1}) async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        getLatestPostResponse = await dio.get(
          'https://insta-daleel.emicon.tech/api/latest-post',
          queryParameters: {
            'token': bearerToken,
            'page': page,
          },
        );
        CommunityTabBehavior.isGetLatestPostResponseDataMapFutureLoaded = true;

        getLatestPostResponseMap =
            getLatestPostResponse.data is Map<String, dynamic>
                ? getLatestPostResponse.data
                : {};

        if (getLatestPostResponseMap.isNotEmpty) {
          String status = getLatestPostResponseMap['status'] is String
              ? getLatestPostResponseMap['status']
              : '';
          if (status == 'success') {
            CommunityTabBehavior.getLatestPostDataMap =
                getLatestPostResponseMap;
            if (CommunityTabBehavior.getLatestPostDataMap.isNotEmpty) {
              getLatestPostDataList = CommunityTabBehavior
                      .getLatestPostDataMap['data'] is List<dynamic>
                  ? CommunityTabBehavior.getLatestPostDataMap['data']
                  : [];
              return getLatestPostDataList;
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
    CommunityTabBehavior.setStateOfLatestPostListView = () {
      CommunityTabBehavior.getLatestPostResponseDataListFuture =
          getLatestPostResponseData();
      setState(() {});
    };
    if (!CommunityTabBehavior.isGetLatestPostResponseDataMapFutureLoaded) {
      CommunityTabBehavior.getLatestPostResponseDataListFuture =
          getLatestPostResponseData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Search View
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xff22A8F3),
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(34, 168, 243, 0.5),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 30),
                      hintText: 'Search Here.....',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
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
          const SizedBox(
            height: 15,
          ),

          // 'What is in your mind ?' container
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'AddPostScreen');
            },
            child: Container(
              height: 50,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 9,
                      offset: Offset(4, 4),
                      color: Color.fromARGB(
                        30,
                        0,
                        0,
                        0,
                      ),
                    ),
                  ]),
              child: const Text(
                'What is in your mind ?',
                style: TextStyle(
                  color: Color(InstaDaleelColors.primaryColor),
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          // divider
          const Divider(
            color: Colors.white,
            height: 10,
            thickness: 2,
          ),

          // refresh post
          InkWell(
            onTap: () {
              // CommunityTabBehavior.setStateOfLatestPostListView();
            },
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Color(InstaDaleelColors.primaryColor),
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Add Photos',
                    style: TextStyle(
                      color: Color(InstaDaleelColors.primaryColor),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //TEMPORAL
          // const CommunityPostCard(
          //   personName: 'Abdul Rashid',
          //   imageUrl:
          //       'https://scontent-lhr8-1.xx.fbcdn.net/v/t39.30808-6/311233719_2264720030344593_3533777974738364520_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=_Fda4M2Yb_YAX-fZb1s&_nc_ht=scontent-lhr8-1.xx&oh=00_AT_b1OEOXfeod1Y5Ct7OKxHgMd3kToBcuGI0QF3aMjUXkw&oe=63467267',
          //   personProfilePicLink:
          //       'https://www.elitesingles.co.uk/wp-content/uploads/sites/59/2019/11/2b_en_articleslide_sm2-350x264.jpg',
          //   postText:
          //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet amet nullam sagittis malesuada. ',
          //   likesCount: 23,
          //   commentsCount: 32,
          //   showImage: true,
          //   isLiked: false,
          //   customerId: -1,
          // ),
          FutureBuilder<List<dynamic>>(
            future: CommunityTabBehavior.getLatestPostResponseDataListFuture,
            initialData: const [],
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
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
                      itemCount: snapshot.data!.length * 2,
                      itemBuilder: (context, i) {
                        if (i.isOdd) {
                          return const SizedBox(
                            height: 8,
                          );
                        }
                        int index = i ~/ 2;
                        return GestureDetector(
                          onTap: () {
                            CommunityTabBehavior.isFromCommunity = true;
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
                            // Navigator.pushNamed(context, 'GetSpecificPersonPost', arguments: snapshot.data![index] is Map<String, dynamic>
                            //     ? snapshot.data![index]['customer_id'] is int ? snapshot.data![index]['customer_id'] : -1 : -1,);
                          },
                          child: /*snapshot.data![index]['image'] == null ||
                                  (jsonDecode(snapshot.data![index]['image']))
                                      .isEmpty
                              ? CommunityPostCard(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      'GetSpecificPersonPost',
                                      arguments: snapshot.data![index]
                                              is Map<String, dynamic>
                                          ? snapshot.data![index]['customer_id']
                                                  is int
                                              ? snapshot.data![index]
                                                  ['customer_id']
                                              : -1
                                          : -1,
                                    );
                                  },
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
                                              ? 'https://insta-daleel.emicon.tech/images/customer/${snapshot.data![index]['customer_data']['image']}'
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
                                  // likesIconData: snapshot.data![index]
                                  //         is Map<String, dynamic>
                                  //     ? snapshot.data![index]['customer_data']
                                  //             is Map<String, dynamic>
                                  //         ? snapshot.data![index]
                                  //                 ['customer_data']['id'] is int
                                  //             ? snapshot.data![index]
                                  //                             ['customer_data']
                                  //                         ['id'] ==
                                  //                     userId
                                  //                 ? Icons.favorite
                                  //                 : Icons
                                  //                     .favorite_border_outlined
                                  //             : Icons.favorite_border_outlined
                                  //         : Icons.favorite_border_outlined
                                  //     : Icons.favorite_border_outlined,
                                  commentsCount: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['total_comment']
                                              is int
                                          ? snapshot.data![index]
                                              ['total_comment']
                                          : -1
                                      : -1,
                                )
                              :*/
                              GestureDetector(
                            onTap: () {
                              CommunityTabBehavior.isFromCommunity = true;
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
                            },
                            child: CommunityPostCard(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  'GetSpecificPersonPost',
                                  arguments: snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_id']
                                              is int
                                          ? snapshot.data![index]['customer_id']
                                          : -1
                                      : -1,
                                );
                              },
                              customerId: snapshot.data![index]
                                      is Map<String, dynamic>
                                  ? snapshot.data![index]['customer_id'] is int
                                      ? snapshot.data![index]['customer_id']
                                      : -1
                                  : -1,
                              personName: snapshot.data![index]
                                      is Map<String, dynamic>
                                  ? snapshot.data![index]['customer_data']
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_data']
                                              ['name'] is String
                                          ? snapshot.data![index]
                                              ['customer_data']['name']
                                          : '---'
                                      : '---'
                                  : '---',
                              postText:
                                  snapshot.data![index] is Map<String, dynamic>
                                      ? snapshot.data![index]['description']
                                              is String
                                          ? snapshot.data![index]['description']
                                          : '---'
                                      : '---',
                              personProfilePicLink: snapshot.data![index]
                                      is Map<String, dynamic>
                                  ? snapshot.data![index]['customer_data']
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_data']
                                              ['image'] is String
                                          ? 'https://insta-daleel.emicon.tech/images/customer/${snapshot.data![index]['customer_data']['image']}'
                                          : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                      : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'
                                  : 'https://www.freeiconspng.com/uploads/profile-icon-1.png',
                              likesCount: snapshot.data![index]
                                      is Map<String, dynamic>
                                  ? snapshot.data![index]['total_like'] is int
                                      ? snapshot.data![index]['total_like']
                                      : -1
                                  : -1,
                              isLiked: snapshot.data![index]
                                      is Map<String, dynamic>
                                  ? snapshot.data![index]['customer_data']
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['customer_data']
                                              ['id'] is int
                                          ? snapshot.data![index]
                                                      ['customer_data']['id'] ==
                                                  userId
                                              ? true
                                              : false
                                          : false
                                      : false
                                  : false,
                              commentsCount: snapshot.data![index]
                                      is Map<String, dynamic>
                                  ? snapshot.data![index]['total_comment']
                                          is int
                                      ? snapshot.data![index]['total_comment']
                                      : -1
                                  : -1,
                              showImage: true,
                              imageUrl: snapshot.data![index]
                                      is Map<String, dynamic>
                                  ? snapshot.data![index]['image'] is String
                                      ? jsonDecode(snapshot.data![index]
                                                  ['image'])
                                              .isNotEmpty
                                          ? 'https://insta-daleel.emicon.tech/images/post/${jsonDecode(snapshot.data![index]['image'])[0]['image']}'
                                          : ''
                                      : ''
                                  : '',
                              //https://bitsofco.de/content/images/2018/12/broken-1.png
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: CommunityTabBehavior
                                .getLatestPostDataMap.isNotEmpty
                            ? CommunityTabBehavior
                                    .getLatestPostDataMap['last_page'] is int
                                ? CommunityTabBehavior
                                    .getLatestPostDataMap['last_page']
                                : 0
                            : 0,
                        itemBuilder: (context, index) {
                          int currentPageIndex = CommunityTabBehavior
                                  .getLatestPostDataMap.isNotEmpty
                              ? CommunityTabBehavior
                                          .getLatestPostDataMap['current_page']
                                      is int
                                  ? CommunityTabBehavior
                                      .getLatestPostDataMap['current_page']
                                  : 0
                              : 0;
                          return IconButton(
                            icon: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color:
                                    const Color(InstaDaleelColors.primaryColor),
                                fontWeight: (index + 1) == currentPageIndex
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize:
                                    (index + 1) == currentPageIndex ? 20 : 14,
                              ),
                            ),
                            onPressed: () {
                              setState(() {});
                              CommunityTabBehavior
                                      .getLatestPostResponseDataListFuture =
                                  getLatestPostResponseData(page: index + 1);
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