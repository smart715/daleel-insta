import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/community/community_tab_widgets/community_tab_small_card.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_behavior.dart';
import '../../../../../../global_members.dart';
import '../../../../../../network_connectivity_handler.dart';
import '../../../../../../widgets/intro_slider_dot.dart';

class LatestPost extends StatefulWidget {
  const LatestPost({
    Key? key,
  }) : super(key: key);

  @override
  State<LatestPost> createState() => _LatestPost();
}

class _LatestPost extends State<LatestPost>
    with GuideTabBehavior, ConnectivityHandler {
  Future<List<dynamic>> getGuideTabLatestPostResponseData() async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        guideTabLatestPostResponse = await dio.get(
          'https://insta-daleel.emicon.tech/api/latest-post',
          queryParameters: {
            'token': bearerToken,
          },
        );

        GuideTabBehavior.isGuideTabLatestPostResponseDataListFutureLoaded =
            true;

        guideTabLatestPostResponseMap =
            guideTabLatestPostResponse.data is Map<String, dynamic>
                ? guideTabLatestPostResponse.data
                : {};

        if (guideTabLatestPostResponseMap.isNotEmpty) {
          String status = guideTabLatestPostResponseMap['status'] is String
              ? guideTabLatestPostResponseMap['status']
              : '';
          if (status == 'success') {
            Map<String, dynamic> dataMap = guideTabLatestPostResponseMap;
            if (dataMap.isNotEmpty) {
              guideTabLatestPostDataList =
                  dataMap['data'] is List<dynamic> ? dataMap['data'] : [];
              return guideTabLatestPostDataList;
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
    GuideTabBehavior.setStateOfGuideTabLatestPostListView = () {
      GuideTabBehavior.guideTabLatestPostResponseDataListFuture =
          getGuideTabLatestPostResponseData();
      setState(() {});
    };
    if (!GuideTabBehavior.isGuideTabLatestPostResponseDataListFutureLoaded) {
      GuideTabBehavior.guideTabLatestPostResponseDataListFuture =
          getGuideTabLatestPostResponseData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: GuideTabBehavior.guideTabLatestPostResponseDataListFuture,
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 155,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          return SizedBox(
            height: 155,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 140,
                  child: PageView.builder(
                    onPageChanged: (int value) {
                      setState(() {
                        GuideTabBehavior.latestPostSliderIndex = value;
                      });
                    },
                    itemCount:
                        snapshot.data!.length >= 3 ? 3 : snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        List<int> idsList = [];

                        idsList
                            .add(snapshot.data![index] is Map<String, dynamic>
                                ? snapshot.data![index]['customer_id'] is int
                                    ? snapshot.data![index]['customer_id']
                                    : -1
                                : -1);

                        idsList
                            .add(snapshot.data![index] is Map<String, dynamic>
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
                                ? snapshot.data![index]['customer_id'] is int
                                    ? snapshot.data![index]['customer_id']
                                    : -1
                                : -1,
                          );
                        },
                        customerId:
                            snapshot.data![index] is Map<String, dynamic>
                                ? snapshot.data![index]['customer_id'] is int
                                    ? snapshot.data![index]['customer_id']
                                    : -1
                                : -1,
                        personName:
                            snapshot.data![index] is Map<String, dynamic>
                                ? snapshot.data![index]['customer_data']
                                        is Map<String, dynamic>
                                    ? snapshot.data![index]['customer_data']
                                            ['name'] is String
                                        ? snapshot.data![index]['customer_data']
                                            ['name']
                                        : '---'
                                    : '---'
                                : '---',
                        postText: snapshot.data![index] is Map<String, dynamic>
                            ? snapshot.data![index]['description'] is String
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
                        likesCount:
                            snapshot.data![index] is Map<String, dynamic>
                                ? snapshot.data![index]['total_like'] is int
                                    ? snapshot.data![index]['total_like']
                                    : -1
                                : -1,
                        isLiked: snapshot.data![index] is Map<String, dynamic>
                            ? snapshot.data![index]['customer_data']
                                    is Map<String, dynamic>
                                ? snapshot.data![index]['customer_data']['id']
                                        is int
                                    ? snapshot.data![index]['customer_data']
                                                ['id'] ==
                                            userId
                                        ? true
                                        : false
                                    : false
                                : false
                            : false,
                        commentsCount:
                            snapshot.data![index] is Map<String, dynamic>
                                ? snapshot.data![index]['total_comment'] is int
                                    ? snapshot.data![index]['total_comment']
                                    : -1
                                : -1,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i < 3;
                          // (snapshot.data!.length >= 3
                          //     ? 3
                          //     : snapshot.data!.length);
                          i++)
                        IntroSliderDot(
                            color: Color(
                                GuideTabBehavior.latestPostSliderIndex == i
                                    ? InstaDaleelColors.primaryColor
                                    : InstaDaleelColors
                                        .introSliderDotInActiveColor)),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('no latest post'),
          );
        }
      },
    );
    /*Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            onPageChanged: (int value) {
              setState(() {
                sliderIndex = value;
              });
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Center(
              child: GestureDetector(
                onTap: widget.guideTabThirdSliderModelList[index].onTap,
                child: Container(
                    margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: widget.guideTabThirdSliderModelList[index].favouritiesIconOnTap,
                                        child: const Padding(
                                          padding: EdgeInsets.only(right: 3),
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        widget.guideTabThirdSliderModelList[index]
                                            .favouritiesCount
                                            .toString(),
                                        style: const TextStyle(
                                          color: Color(0xFFB1B1B1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: widget.guideTabThirdSliderModelList[index].messageIconOnTap,
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 3),
                                        child: Icon(
                                          Icons.chat_bubble_outline,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.guideTabThirdSliderModelList[index].messageCount.toString(),
                                      style: const TextStyle(
                                        color: Color(0xFFB1B1B1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Text(
                                      widget
                                          .guideTabThirdSliderModelList[index].personName,
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Color(InstaDaleelColors.primaryColor),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/main_page/home_page/guide_tab/dp_to_delete_two.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              widget.guideTabThirdSliderModelList[index]
                                  .description,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IntroSliderDot(
                  color: Color(sliderIndex == 0
                      ? InstaDaleelColors.primaryColor
                      : InstaDaleelColors.introSliderDotInActiveColor)),
              IntroSliderDot(
                  color: Color(sliderIndex == 1
                      ? InstaDaleelColors.primaryColor
                      : InstaDaleelColors.introSliderDotInActiveColor)),
              IntroSliderDot(
                  color: Color(sliderIndex == 2
                      ? InstaDaleelColors.primaryColor
                      : InstaDaleelColors.introSliderDotInActiveColor)),
            ],
          ),
        ),
      ],
    )*/
  }
}
