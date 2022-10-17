import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui' as ui;
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
          'https://insta-daleel.emicon.tech/api/get-banners',
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
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          return SizedBox(
            height: 220,
            // width: MediaQuery.of(context).size.width,
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
                    itemBuilder: (context, index) => BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: const Color(InstaDaleelColors.primaryColor),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(34, 168, 243, 1),
                                offset: Offset(2.0, 1.0),
                                blurRadius: 6.0,
                              ),
                            ],
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/main_page/home_page/guide_tab/banner_bkg.png',
                              ),
                            ),
                            // gradient: const LinearGradient(
                            //   begin: Alignment.topCenter,
                            //   end: Alignment.bottomCenter,
                            //   colors: <Color>[
                            //     Color.fromRGBO(6, 122, 225, 0.79),
                            //     Color.fromRGBO(0, 175, 251, 0.79)
                            //   ],
                            //   stops: [
                            //     0.0,
                            //     1.0,
                            //   ],
                            //   tileMode: TileMode.clamp,
                            // ),
                            borderRadius: BorderRadius.circular(30),
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
                                placeholder:
                                    (BuildContext context, String url) =>
                                        const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Center(
                                        child: Icon(
                                  Icons.error_outline_outlined,
                                  color: Colors.white,
                                )),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          ? snapshot.data![index]['link']
                                                  is String
                                              ? snapshot.data![index]['link']
                                              : ''
                                          : '';
                                      try {
                                        final Uri url = Uri.parse(
                                            'https://insta-daleel.emicon.tech${linkAddress.substring(21)}');
                                        await launchUrl(url);
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'unable to launch URL')));
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
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            snapshot.data![index]
                                                    is Map<String, dynamic>
                                                ? snapshot.data![index]
                                                            ['button_text']
                                                        is String
                                                    ? snapshot.data![index]
                                                        ['button_text']
                                                    : '---'
                                                : '---',
                                            style: const TextStyle(
                                              color: Color(InstaDaleelColors
                                                  .primaryColor),
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
