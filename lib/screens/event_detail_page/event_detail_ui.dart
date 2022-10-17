import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/company/company_widgets/company_card_display.dart';
import 'package:insta_daleel/screens/event_detail_page/event_detail_behavior.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({Key? key, required this.eventId}) : super(key: key);
  static const String eventDetailRoute = 'EventDetail';

  final int eventId;

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail>
    with EventDetailBehavior, ConnectivityHandler {
  Future<Map<String, dynamic>> getEventDetailResponseData() async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        Response eventDetailResponse = await dio.get(
          'https://insta-daleel.emicon.tech/api/event-details',
          queryParameters: {
            'token': bearerToken,
            'customer_id': userId,
            'event_id': widget.eventId,
          },
        );

        Map<String, dynamic> eventDetailResponseMap =
            eventDetailResponse.data is Map<String, dynamic>
                ? eventDetailResponse.data
                : {};

        if (eventDetailResponseMap.isNotEmpty) {
          String status = eventDetailResponseMap['status'] is String
              ? eventDetailResponseMap['status']
              : '';
          if (status == 'success') {
            Map<String, dynamic> eventDetailDataMap =
                eventDetailResponseMap['data'] is Map<String, dynamic>
                    ? eventDetailResponseMap['data']
                    : {};
            return eventDetailDataMap;
          } else {
            return {};
          }
        } else {
          return {};
        }
      } catch (e) {
        return {};
      }
    } else {
      return {};
    }
  }

  @override
  void initState() {
    EventDetailBehavior.eventDetailResponseDataMapFuture =
        getEventDetailResponseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: Column(
        children: [
          // app bar
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
              title: const Center(
                child: Text(
                  'Event Details',
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
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: EventDetailBehavior.eventDetailResponseDataMapFuture,
              initialData: const {},
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data!.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // event detail image
                          CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl:
                                //  snapshot.data!['image'] is String
                                //     ? snapshot.data!['image']
                                //     :
                                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                // 'Annual Musical Event' text
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    // snapshot.data!['title'] is String
                                    //     ? snapshot.data!['title']
                                    //     : '---',
                                    '10 Years Service Free On All\nSUV and Other Cars',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(
                                            InstaDaleelColors.primaryColor),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                                // event detail text
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: leftRightGlobalMargin),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    // snapshot.data!['description'] is String
                                    //     ? snapshot.data!['description']
                                    //     : '---',
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet laoreet dictum nec, molestie. Eget felis turpis dui, scelerisque volutpat odio venenatis. Interdum quis malesuada cras commodo justo, lectus et. Sit placerat mauris erat quam feugiat aliquam in est. Odio quis eget eget morbi sed. Dolor curabitur in nulla ut leo vitae. Egestas varius blandit turpis facilisis diam. Nulla id ac faucibus viverra urna euismod. Nisl at scelerisque sem egestas faucibus. Non sed ridiculus senectus turpis nunc ut etiam. Pellentesque sed ullamcorper aliquam urna augue vitae bibendum. molestie. Eget felis turpis dui, scelerisque volutpat odio venenatis. Interdum quis malesuada cras commodo justo, lectus et. Sit placerat mauris erat quam feugiat aliquam in est. Odio quis eget eget morbi sed. Dolor curabitur in nulla ut leo vitae. Egestas varius blandit turpis facilisis diam. Nulla id ac faucibus viverra urna euismod. Nisl at scelerisque sem egestas faucibus. Non sed ridiculus senectus turpis nunc ut etiam. Pellentesque sed ullamcorper aliquam urna augue vitae bibendum. ',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color.fromRGBO(55, 55, 55, 0.7),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                // size box
                                const SizedBox(
                                  height: 20,
                                ),

                                // divider
                                const Divider(
                                  height: 30,
                                  thickness: 1,
                                  indent: leftRightGlobalMargin,
                                  endIndent: leftRightGlobalMargin,
                                ),

                                // phone number section
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '---',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: leftRightGlobalMargin,
                                            left: 14),
                                        child: Image(
                                          height: 25,
                                          image: AssetImage(
                                            'assets/images/event_detail/mobile.png',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // divider
                                const Divider(
                                  height: 30,
                                  thickness: 1,
                                  indent: leftRightGlobalMargin,
                                  endIndent: leftRightGlobalMargin,
                                ),

                                // time section
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${snapshot.data!['time'] is String ? snapshot.data!['time'] : '---'} - ${snapshot.data!['date'] is String ? snapshot.data!['date'] : '---'}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            right: leftRightGlobalMargin,
                                            left: 14),
                                        child: Image(
                                          height: 25,
                                          image: AssetImage(
                                            'assets/images/event_detail/time.png',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // divider
                                const Divider(
                                  height: 30,
                                  thickness: 1,
                                  indent: leftRightGlobalMargin,
                                  endIndent: leftRightGlobalMargin,
                                ),

                                // location section
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        snapshot.data!['event_location']
                                                is String
                                            ? snapshot.data!['event_location']
                                            : '---',
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            right: leftRightGlobalMargin,
                                            left: 14),
                                        child: Image(
                                          height: 25,
                                          image: AssetImage(
                                            'assets/images/event_detail/location.png',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // map section
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20,
                                      left: leftRightGlobalMargin,
                                      right: leftRightGlobalMargin),
                                  child: const Image(
                                    image: AssetImage(
                                      'assets/images/event_detail/map.png',
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 15,
                                ),
                                // rating card
                                const CompanyDisplayCard(
                                  title: 'Global Architecture',
                                  description:
                                      'Lorem ipsum dolor sit amet, consectetur ',
                                  image:
                                      'assets/images/main_page/home_page/guide_tab/rating_card_slider_image.png',
                                  rating: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('no event detail available'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
