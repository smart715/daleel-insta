import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';

import 'events_tab_widgets/event_card.dart';

class EventsTab extends StatefulWidget {
  const EventsTab({Key? key}) : super(key: key);

  @override
  State<EventsTab> createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab> {
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

          // Event Cards
          EventCard(
            onTap: (){},
            title: 'Child Protection Awareness',
            subTitle: 'Today At 8:00 PM',
            backgroundImagePath: 'assets/images/main_page/home_page/events_tab/bg1.png',
            iconPath: 'assets/images/main_page/home_page/events_tab/calender_add_icon.png',
          ),
          EventCard(
            onTap: (){
              Navigator.pushNamed(context, 'EventDetail');
            },
            title: 'Annual Musical Event',
            subTitle: 'Today At 8:00 PM',
            backgroundImagePath: 'assets/images/main_page/home_page/events_tab/bg2.png',
            iconPath: 'assets/images/main_page/home_page/events_tab/calender_add_icon.png',
          ),
          EventCard(
            onTap: (){},
            title: 'Circus Event For Children',
            subTitle: 'Today At 8:00 PM',
            backgroundImagePath: 'assets/images/main_page/home_page/events_tab/bg3.png',
            iconPath: 'assets/images/main_page/home_page/events_tab/calender_add_icon.png',
          ),
          EventCard(
            onTap: (){},
            title: 'Business Startup For IT',
            subTitle: 'Today At 8:00 PM',
            backgroundImagePath: 'assets/images/main_page/home_page/events_tab/bg4.png',
            iconPath: 'assets/images/main_page/home_page/events_tab/calender_add_icon.png',
          ),
        ],
      ),
    );
  }
}
