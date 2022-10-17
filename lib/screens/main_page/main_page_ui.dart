import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/main_page/home_page/home_page_ui.dart';
import 'package:insta_daleel/screens/main_page/search_page/search_page_ui.dart';
import 'package:insta_daleel/screens/main_page/settings_page/settings_ui.dart';
import '../../constants/colors.dart';
import 'categories_page/categories_screen.dart';
import 'featured_page/featured_page_ui.dart';
import 'main_page_behavior.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with MainPageBehavior {
  BottomNavigationBarItem getBottomNavigationBarItem(
      {required String iconAssetPath, required String title}) {
    return BottomNavigationBarItem(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      label: '',
      icon: SizedBox(
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 20,
              width: 20,
              color: const Color(0xFFB1B1B1),
              image: AssetImage(iconAssetPath),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFB1B1B1),
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
      activeIcon: SizedBox(
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // elevation: 5.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  // color: const Color(InstaDaleelColors.primaryColor),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(-10, -10),
                      blurRadius: 20,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 20,
                      color: Color.fromRGBO(41, 39, 130, 0.15),
                    )
                  ],
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/nav/nav_bkg.png',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Image(
                    height: 24,
                    width: 24,
                    color: Colors.white,
                    alignment: Alignment.center,
                    image: AssetImage(iconAssetPath),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFB1B1B1),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomNavigationPage() {
    switch (MainPageBehavior.currentIndex) {
      case 0:
        {
          return const CategoriesPageNavigator();
        }

      case 1:
        {
          return const FeaturedCompanies();
        }

      case 2:
        {
          return const HomePageNavigator();
        }

      case 3:
        {
          return const SearchPage();
        }

      case 4:
        {
          return const SettingsPage();
        }

      default:
        {
          return const Center(
            child: Text('Default'),
          );
        }
    }
  }

  /*Widget getBottomNavigationPage() {
    switch(currentIndex) {
      case 0 : {
        return Container(
          color: Colors.amber,
          child: const Center(
            child: Text('Category'),
          ),
        );
      }

      case 1 : {
        return Container(
          color: Colors.black45,
          child: const Center(
            child: Text('Featured'),
          ),
        );
      }

      case 2 : {
        return const HomePage();
      }

      case 3 : {
        return Container(
          color: Colors.blueAccent,
          child: const Center(
            child: Text('Search'),
          ),
        );
      }

      case 4 :  {
        return Container(
          color: Colors.deepOrange,
          child: const Center(
            child: Text('Settings'),
          ),
        );
      }

      default : {
        return const Center(
          child: Text('Default'),
        );
      }
    }
  }*/

  @override
  void initState() {
    MainPageBehavior.setStateOfMainPageScreen = () {
      setState(() {});
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: WillPopScope(
        onWillPop: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('press BACK again to quit'),
            duration: Duration(seconds: 2),
          ));
          DateTime currentTime = DateTime.now();
          if (time == null ||
              currentTime.difference(time!) > const Duration(seconds: 2)) {
            time = currentTime;
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: getBottomNavigationPage(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 17, right: 17, top: 10),
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            fontSize: 0,
          ),
          elevation: 0.0,
          backgroundColor: const Color(InstaDaleelColors.backgroundColor),
          currentIndex: MainPageBehavior.currentIndex,
          items: [
            getBottomNavigationBarItem(
                iconAssetPath:
                    'assets/images/main_page/bottom_navigation_bar/categories.png',
                title: 'Categories'),
            getBottomNavigationBarItem(
                iconAssetPath:
                    'assets/images/main_page/bottom_navigation_bar/badge.png',
                title: 'Featured'),
            getBottomNavigationBarItem(
                iconAssetPath:
                    'assets/images/main_page/bottom_navigation_bar/home.png',
                title: 'Home'),
            getBottomNavigationBarItem(
                iconAssetPath:
                    'assets/images/main_page/bottom_navigation_bar/search.png',
                title: 'Search'),
            getBottomNavigationBarItem(
                iconAssetPath:
                    'assets/images/main_page/bottom_navigation_bar/setting.png',
                title: 'Settings'),
          ],
          onTap: (int index) {
            setState(() {
              MainPageBehavior.currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
