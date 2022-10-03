import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/events/event_tab_behavior.dart';

import '../../../../../global_members.dart';
import 'events_tab_widgets/event_card.dart';

class EventsTab extends StatefulWidget {
  const EventsTab({Key? key}) : super(key: key);

  @override
  State<EventsTab> createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab>
    with EventTabBehavior, ConnectivityHandler {
  Future<List<dynamic>> getEventResponseData({int page = 1}) async {
    if (await checkForInternetServiceAvailability(context)) {
      try {
        eventResponse = await dio.get(
          '$baseUrl/api/get-event',
          queryParameters: {
            'token': bearerToken,
            'page': page,
          },
        );

        EventTabBehavior.isEventResponseDataListFutureLoaded = true;

        Map<String, dynamic> eventResponseMap =
            eventResponse.data is Map<String, dynamic>
                ? eventResponse.data
                : {};

        if (eventResponseMap.isNotEmpty) {
          String status = eventResponseMap['status'] is String
              ? eventResponseMap['status']
              : '';
          if (status == 'success') {
            EventTabBehavior.eventDataMap =
                eventResponseMap['data'] is Map<String, dynamic>
                    ? eventResponseMap['data']
                    : {};
            if (EventTabBehavior.eventDataMap.isNotEmpty) {
              List<dynamic> eventDataList =
                  EventTabBehavior.eventDataMap['data'] is List<dynamic>
                      ? EventTabBehavior.eventDataMap['data']
                      : [];
              return eventDataList;
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
    if (!EventTabBehavior.isEventResponseDataListFutureLoaded) {
      EventTabBehavior.eventResponseDataListFuture = getEventResponseData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // City and Time Drop down
          Container(
            alignment: Alignment.bottomCenter,
            height: 70,
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(InstaDaleelColors.primaryColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'City',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(InstaDaleelColors.primaryColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Time',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
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
              setState(() {});
              EventTabBehavior.eventResponseDataListFuture =
                  getEventResponseData();
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

          const SizedBox(
            height: 15,
          ),

          // Event Cards
          FutureBuilder<List<dynamic>>(
            future: EventTabBehavior.eventResponseDataListFuture,
            initialData: const [],
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data!.isNotEmpty) {
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String date =
                            snapshot.data![index] is Map<String, dynamic>
                                ? snapshot.data![index]['date'] is String
                                    ? snapshot.data![index]['date']
                                    : '---'
                                : '---';

                        String time =
                            snapshot.data![index] is Map<String, dynamic>
                                ? snapshot.data![index]['time'] is String
                                    ? snapshot.data![index]['time']
                                    : '---'
                                : '---';

                        return EventCard(
                          onTap: () {
                            int eventId =
                                snapshot.data![index] is Map<String, dynamic>
                                    ? snapshot.data![index]['id'] is int
                                        ? snapshot.data![index]['id']
                                        : -1
                                    : -1;

                            Navigator.pushNamed(context, 'EventDetail',
                                arguments: eventId);
                          },
                          title: snapshot.data![index] is Map<String, dynamic>
                              ? snapshot.data![index]['title'] is String
                                  ? snapshot.data![index]['title']
                                  : '---'
                              : '---',
                          dateAndTime: '$date At $time',
                          backgroundImageLink: snapshot.data![index]
                                  is Map<String, dynamic>
                              ? snapshot.data![index]['image'] is String
                                  ? '$baseUrl/images/event/${snapshot.data![index]['image']}'
                                  : 'https://bitsofco.de/content/images/2018/12/broken-1.png'
                              : 'https://bitsofco.de/content/images/2018/12/broken-1.png',
                          iconPath:
                              'assets/images/main_page/home_page/events_tab/calender_add_icon.png',
                        );
                      },
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: EventTabBehavior.eventDataMap.isNotEmpty
                            ? EventTabBehavior.eventDataMap['last_page'] is int
                                ? EventTabBehavior.eventDataMap['last_page']
                                : 0
                            : 0,
                        itemBuilder: (context, index) {
                          int currentPageIndex = EventTabBehavior
                                  .eventDataMap.isNotEmpty
                              ? EventTabBehavior.eventDataMap['current_page']
                                      is int
                                  ? EventTabBehavior
                                      .eventDataMap['current_page']
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
                              EventTabBehavior.eventResponseDataListFuture =
                                  getEventResponseData(page: index + 1);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('no event'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
