import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/main_page/home_page/home_page_ui.dart';
import '../../constants/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 2;
  DateTime? time;

  BottomNavigationBarItem getBottomNavigationBarItem({required String iconAssetPath, required String title}) {
    return BottomNavigationBarItem(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      label: '',
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ),
              ),
            ),
          ],
        ),
      activeIcon: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(InstaDaleelColors.primaryColor),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Image(
                  height: 30,
                  width: 30,
                  color: Colors.white,
                  image: AssetImage(iconAssetPath),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFB1B1B1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBottomNavigationPage() {
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
        return const HomePageNavigator();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      //
      body: WillPopScope(
        onWillPop: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('press BACK again to quit'), duration: Duration(seconds: 2),));
          DateTime currentTime = DateTime.now();
          if(time == null || currentTime.difference(time!) > const Duration(seconds: 2)) {
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
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontSize: 0,
        ),
        elevation: 0.0,
        backgroundColor: const Color(InstaDaleelColors.backgroundColor),
        currentIndex: currentIndex,
        items: [
          getBottomNavigationBarItem(iconAssetPath: 'assets/images/main_page/bottom_navigation_bar/categories.png', title: 'Categories'),
          getBottomNavigationBarItem(iconAssetPath: 'assets/images/main_page/bottom_navigation_bar/badge.png', title: 'Featured'),
          getBottomNavigationBarItem(iconAssetPath: 'assets/images/main_page/bottom_navigation_bar/home.png', title: 'Home'),
          getBottomNavigationBarItem(iconAssetPath: 'assets/images/main_page/bottom_navigation_bar/search.png', title: 'Search'),
          getBottomNavigationBarItem(iconAssetPath: 'assets/images/main_page/bottom_navigation_bar/setting.png', title: 'Settings'),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}