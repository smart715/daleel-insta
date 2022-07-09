import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/main_page/home_page/home_page_behavior.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/community/community_tab_ui.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/events/events_tab_ui.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_ui.dart';
import '../../../constants/colors.dart';
import '../../community_inside_photo_page/community_inside_photo_ui.dart';
import '../../company_inner_page/company_inner_page_ui.dart';
import '../../shopping_malls/shopping_malls_ui.dart';

class HomePageNavigator extends StatefulWidget {
  const HomePageNavigator({Key? key}) : super(key: key);

  @override
  State<HomePageNavigator> createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: HomePage.homePageRoute,
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case HomePage.homePageRoute: {
            return MaterialPageRoute(builder: (context) {
              return const HomePage();
            },);
          }
          case ShoppingMalls.shoppingMallsRoute: {
            return MaterialPageRoute(builder: (context) => const ShoppingMalls(),);
          }
          case CompanyInnerPage.companyInnerPageRoute: {
            return MaterialPageRoute(builder: (context) => const CompanyInnerPage(),);
          }
          case CommunityInsidePhotoPage.communityInsidePhotoRoute: {
            return MaterialPageRoute(builder: (context) => const CommunityInsidePhotoPage(),);
          }
          default: {
            return MaterialPageRoute(builder: (context) => const Center(child: Text('Default Screen'),),);
          }
        }
      },
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String homePageRoute = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageBehavior, TickerProviderStateMixin{

  @override
  void initState() {
    homePageTabController = TabController(length: 4, vsync: this);
    homePageTabController.index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            leading: Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 5.0,
              child: Container(
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
                    image: AssetImage('assets/images/main_page/app_bar/dp_to_delete.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            title: const Center(
              child: Text(
                'Insta Daleel',
                style: TextStyle(
                    color: Color(InstaDaleelColors.primaryColor),
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            trailing: SizedBox(
              width: 70,
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {

                    },
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/main_page/app_bar/main_screen_appbar_notification_icon.png'
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                    },
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/main_page/app_bar/main_screen_appbar_help_info_icon.png'
                      ),
                    ),
                  )
                ],
              ),
            ),
            /*trailing: Material(
                  borderRadius: BorderRadius.circular(25),
                  elevation: 5.0,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(InstaDaleelColors.primaryColor)
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),*/
          ),
        ),
        TabBar(
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(InstaDaleelColors.primaryColor),
          ),
          unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
            color: Color(InstaDaleelColors.primaryColor),
          ),
          indicatorColor: const Color(0xFF9EE1EC),
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.only(left: 10, right: 10),
          indicatorWeight: 5,
          unselectedLabelColor: const Color(InstaDaleelColors.primaryColor),
          labelColor: const Color(InstaDaleelColors.primaryColor),
          controller: homePageTabController,
          tabs: const <Widget>[
            Tab(
              text: 'Guide',
            ),
            Tab(
              text: 'Offers',
            ),
            Tab(
              text: 'Events',
            ),
            Tab(
              text: 'Community',
            ),

          ],
        ),
        Expanded(
          child: TabBarView(
            controller: homePageTabController,
            children: const <Widget>[
              GuideTab(),
              Center(child: Text('1')),
              EventsTab(),
              CommunityTab(),
            ],
          ),
        ),
      ],
    );
  }
}
