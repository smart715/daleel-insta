import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/add_comment_page/add_comment_ui.dart';
import 'package:insta_daleel/screens/manage_account/add_company_page/add_company_ui.dart';
import 'package:insta_daleel/screens/add_post_page/add_post_ui.dart';
import 'package:insta_daleel/screens/edit_profile_page/update_profile_ui.dart';
import 'package:insta_daleel/screens/event_detail_page/event_detail_ui.dart';
import 'package:insta_daleel/screens/get_specific_person_post_page/get_specific_person_post_ui.dart';
import 'package:insta_daleel/screens/latest_company_reviews_page/latest_company_reviews_ui.dart';
import 'package:insta_daleel/screens/latest_reviews_page/latest_reviews_ui.dart';
import 'package:insta_daleel/screens/main_page/home_page/home_page_behavior.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/community/community_tab_ui.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/events/events_tab_ui.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_behavior.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/guide/guide_tab_ui.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/offers/offers_tab_ui.dart';
import 'package:insta_daleel/screens/manage_account/account_page/account_page.dart';
import 'package:insta_daleel/screens/offer_details_page/offer_details_ui.dart';
import 'package:insta_daleel/screens/profile_page/profile_page_ui.dart';
import 'package:insta_daleel/screens/update_post_page/update_post_ui.dart';
import '../../../constants/colors.dart';
import '../../../global_members.dart';
import '../../box_detail_page/box_detail_ui.dart';
import '../../company_inner_page/company_inner_page_ui.dart';
import '../../post_detail_page/post_detail_ui.dart';
import '../../sub_category_page/sub_category_ui.dart';

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
        switch (settings.name) {
          case HomePage.homePageRoute:
            {
              return MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              );
            }
          case CompanyInnerPage.companyInnerPageRoute:
            {
              return MaterialPageRoute(
                builder: (context) => const CompanyInnerPage(),
              );
            }
          case PostDetailPage.postDetailPageRoute:
            {
              List<int> idsList = settings.arguments as List<int>;
              return MaterialPageRoute(
                builder: (context) =>
                    PostDetailPage(customerId: idsList[0], postId: idsList[1]),
              );
            }
          case EventDetail.eventDetailRoute:
            {
              int eventId = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) => EventDetail(eventId: eventId),
              );
            }
          case BoxDetail.boxDetailRoute:
            {
              int boxId = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) => BoxDetail(boxId: boxId),
              );
            }
          case LatestCompanyReviews.latestCompanyReviewsRoute:
            {
              return MaterialPageRoute(
                builder: (context) => const LatestCompanyReviews(),
              );
            }
          case ProfilePage.profilePageRoute:
            {
              return MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              );
            }
          case OfferDetails.offerDetailsRoute:
            {
              return MaterialPageRoute(
                builder: (context) => const OfferDetails(),
              );
            }
          case LatestReviews.latestReviewsRoute:
            {
              return MaterialPageRoute(
                builder: (context) => const LatestReviews(),
              );
            }
          case AddCompany.addCompanyRoute:
            {
              return MaterialPageRoute(
                builder: (context) => const AddCompany(),
              );
            }
          case ManageAccount.manageAccountRoute:
            {
              return MaterialPageRoute(
                builder: (context) => const ManageAccount(),
              );
            }
          case UpdateProfile.editProfileRoute:
            {
              return MaterialPageRoute(
                builder: (context) => const UpdateProfile(),
              );
            }
          case GetSpecificPersonPost.getSpecificPersonPostRoute:
            {
              int id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) => GetSpecificPersonPost(
                  customerId: id,
                ),
              );
            }
          case AddPostScreen.addPostScreenRoute:
            {
              return MaterialPageRoute(
                builder: (context) => const AddPostScreen(),
              );
            }
          case AddCommentScreen.addCommentScreenRoute:
            {
              int id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) => AddCommentScreen(postId: id),
              );
            }
          case UpdatePostScreen.updatePostScreenRoute:
            {
              List<dynamic> list = settings.arguments as List<dynamic>;
              return MaterialPageRoute(
                builder: (context) => UpdatePostScreen(
                  postId: list[0],
                  descriptionToBeUpdated: list[1],
                ),
              );
            }
          case SubCategories.subCategoriesRoute:
            {
              List<String> argumentList = settings.arguments as List<String>;
              return MaterialPageRoute(
                builder: (context) => SubCategories(
                  categoryId: argumentList[0],
                  categoryName: argumentList[1],
                ),
              );
            }
          default:
            {
              return MaterialPageRoute(
                builder: (context) => const Center(
                  child: Text('Default Screen'),
                ),
              );
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

class _HomePageState extends State<HomePage>
    with HomePageBehavior, TickerProviderStateMixin {
  @override
  void initState() {
    HomePageBehavior.homePageTabController =
        TabController(length: 4, vsync: this);
    HomePageBehavior.homePageTabController.index = 0;
    HomePageBehavior.homePageTabController.addListener(() {
      GuideTabBehavior.latestPostSliderIndex = 0;
    });
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
            leading: const HomePageProfilePic(),
            title: const Center(
              child: Text(
                'Insta Daleel',
                style: TextStyle(
                    color: Color(InstaDaleelColors.primaryColor),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
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
                    onTap: () {},
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/main_page/app_bar/main_screen_appbar_notification_icon.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/main_page/app_bar/main_screen_appbar_help_info_icon.png'),
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
          controller: HomePageBehavior.homePageTabController,
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
            controller: HomePageBehavior.homePageTabController,
            children: const <Widget>[
              GuideTab(),
              OffersTab(),
              EventsTab(),
              CommunityTab(),
            ],
          ),
        ),
      ],
    );
  }
}

class HomePageProfilePic extends StatefulWidget {
  const HomePageProfilePic({Key? key}) : super(key: key);

  static VoidCallback setStateHomePageProfilePic = () {};

  @override
  State<HomePageProfilePic> createState() => _HomePageProfilePicState();
}

class _HomePageProfilePicState extends State<HomePageProfilePic> {
  @override
  void initState() {
    HomePageProfilePic.setStateHomePageProfilePic = () {
      setState(() {});
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      elevation: 5.0,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'ProfilePage');
        },
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
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                userProfilePicLink != null
                    ? userProfilePicLink!
                    : 'https://www.freeiconspng.com/uploads/profile-icon-1.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
