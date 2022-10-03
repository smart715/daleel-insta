import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_behavior.dart';

import '../../../../../../global_members.dart';

class BoxSection extends StatefulWidget {
  const BoxSection({Key? key}) : super(key: key);

  @override
  State<BoxSection> createState() => _BoxSectionState();
}

class _BoxSectionState extends State<BoxSection>
    with GuideTabBehavior, ConnectivityHandler {
  Future<List<dynamic>> getBoxResponseData() async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        boxResponse = await dio.get(
          '$baseUrl/api/get-boxes',
          queryParameters: {
            'token': bearerToken,
          },
        );
        GuideTabBehavior.isBoxResponseDataListFutureLoaded = true;

        boxResponseMap =
            boxResponse.data is Map<String, dynamic> ? boxResponse.data : {};

        if (boxResponseMap.isNotEmpty) {
          String status = boxResponseMap['status'] is String
              ? boxResponseMap['status']
              : '';
          if (status == 'success') {
            Map<String, dynamic> dataMap =
                boxResponseMap['data'] is Map<String, dynamic>
                    ? boxResponseMap['data']
                    : {};
            if (dataMap.isNotEmpty) {
              boxDataList =
                  dataMap['data'] is List<dynamic> ? dataMap['data'] : [];
              return boxDataList;
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
    if (!GuideTabBehavior.isBoxResponseDataListFutureLoaded) {
      GuideTabBehavior.boxResponseDataListFuture = getBoxResponseData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GuideTabBehavior.boxResponseDataListFuture,
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  'BoxDetail',
                  arguments: snapshot.data![index] is Map<String, dynamic>
                      ? snapshot.data![index]['id'] is int
                          ? snapshot.data![index]['id']
                          : -1
                      : -1,
                );
              },
              child: Container(
                // margin: const EdgeInsets.only(left: 0), // it was 10.0
                height: 90,
                width: 170,
                // width: MediaQuery.of(context).size.width / 2 - 0, // it was 2 - 15
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  'assets/images/main_page/home_page/guide_tab/rectangle_two.png',
                ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      height: 30,
                      width: 30,
                      fit: BoxFit.contain,
                      imageUrl: snapshot.data![index] is Map<String, dynamic>
                          ? snapshot.data![index]['image'] is String
                              ? snapshot.data![index]['image']
                              : 'https://cdn-icons-png.flaticon.com/512/159/159469.png'
                          : 'https://cdn-icons-png.flaticon.com/512/159/159469.png',
                      placeholder: (BuildContext context, String url) =>
                          const Center(
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
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: Center(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Text(
                            snapshot.data![index] is Map<String, dynamic>
                                ? snapshot.data![index]['title'] is String
                                    ? snapshot.data![index]['title']
                                    : '---'
                                : '---',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: Text(
              'no box available',
            ),
          );
        }
      },
    );
  }
}
