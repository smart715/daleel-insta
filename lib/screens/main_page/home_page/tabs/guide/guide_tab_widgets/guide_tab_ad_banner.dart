import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../global_members.dart';
import '../../../../../../network_connectivity_handler.dart';
import '../../../../../../widgets/intro_slider_dot.dart';
import '../guide_tab_behavior.dart';

class GuideTabAdBanner extends StatefulWidget {
  const GuideTabAdBanner({
    Key? key,
  }) : super(key: key);

  @override
  State<GuideTabAdBanner> createState() => _GuideTabAdBannerState();
}

class _GuideTabAdBannerState extends State<GuideTabAdBanner>
    with GuideTabBehavior, ConnectivityHandler {
  Future<List<dynamic>> getAdBannerResponseData() async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        adBannerResponse = await dio.get(
          '$baseUrl/api/get-banners',
          queryParameters: {
            'token': bearerToken,
          },
        );

        GuideTabBehavior.isAdBannerResponseDataListFutureLoaded = true;

        adBannerResponseMap = adBannerResponse.data is Map<String, dynamic>
            ? adBannerResponse.data
            : {};

        if (adBannerResponseMap.isNotEmpty) {
          String status = adBannerResponseMap['status'] is String
              ? adBannerResponseMap['status']
              : '';
          if (status == 'success') {
            Map<String, dynamic> dataMap =
                adBannerResponseMap['data'] is Map<String, dynamic>
                    ? adBannerResponseMap['data']
                    : {};
            if (dataMap.isNotEmpty) {
              adBannerDataList =
                  dataMap['data'] is List<dynamic> ? dataMap['data'] : [];
              // GuideTabBehavior.isAdBannerResponseDataMapFutureLoaded = true;
              return adBannerDataList;
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
    if (!GuideTabBehavior.isAdBannerResponseDataListFutureLoaded) {
      GuideTabBehavior.adBannerResponseDataListFuture =
          getAdBannerResponseData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GuideTabBehavior.adBannerResponseDataListFuture,
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          return SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    onPageChanged: (int value) {
                      setState(() {
                        adBannerSliderIndex = value;
                      });
                    },
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(
                          left: leftRightGlobalMargin,
                          right: leftRightGlobalMargin),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(InstaDaleelColors.primaryColor),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CachedNetworkImage(
                            height: 150,
                            width: 150,
                            fit: BoxFit.fill,
                            imageUrl: snapshot.data![index]
                                    is Map<String, dynamic>
                                ? snapshot.data![index]['image'] is String
                                    ? snapshot.data![index]['image']
                                    : 'https://bitsofco.de/content/images/2018/12/broken-1.png'
                                : 'https://bitsofco.de/content/images/2018/12/broken-1.png',
                            placeholder: (BuildContext context, String url) =>
                                const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Center(
                                child: Icon(
                              Icons.error_outline_outlined,
                              color: Colors.white,
                            )),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              LimitedBox(
                                maxWidth:
                                    MediaQuery.of(context).size.width - 220,
                                maxHeight: 100,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Text(
                                    snapshot.data![index]
                                            is Map<String, dynamic>
                                        ? snapshot.data![index]['title']
                                                is String
                                            ? snapshot.data![index]['title']
                                            : '---'
                                        : '---',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  String linkAddress = snapshot.data![index]
                                          is Map<String, dynamic>
                                      ? snapshot.data![index]['link'] is String
                                          ? snapshot.data![index]['link']
                                          : ''
                                      : '';
                                  try {
                                    final Uri url = Uri.parse(
                                        'https://insta-daleel.emicon.tech${linkAddress.substring(21)}');
                                    await launchUrl(url);
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('unable to launch URL')));
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        snapshot.data![index]
                                                is Map<String, dynamic>
                                            ? snapshot.data![index]
                                                    ['button_text'] is String
                                                ? snapshot.data![index]
                                                    ['button_text']
                                                : '---'
                                            : '---',
                                        style: const TextStyle(
                                          color: Color(
                                              InstaDaleelColors.primaryColor),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < snapshot.data!.length; i++)
                        IntroSliderDot(
                            color: Color(adBannerSliderIndex == i
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
          return const SizedBox(
            height: 10,
            width: 0,
          );
        }
      },
    );
  }
}
