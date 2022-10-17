import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/favorites/community/fav_community.dart';
import 'package:insta_daleel/screens/favorites/companies/categories.dart';
import 'package:insta_daleel/screens/favorites/offers/fav_offers.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  static const addPostScreenRoute = 'FavoriteScreen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          isKeyboardOpen = false;
        },
        child: Column(
          children: [
            // app bar
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    isKeyboardOpen = false;
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(InstaDaleelColors.primaryColor),
                  ),
                ),
                title: const Center(
                  child: Text(
                    'Favorites',
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      FavoriteTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const SelectCategory())));
                        },
                        title: 'Favorites Companies',
                        images: const [
                          'assets/images/main_page/featured_page/1.png',
                          'assets/images/main_page/featured_page/2.png',
                          'assets/images/main_page/featured_page/3.png',
                        ],
                      ),
                      FavoriteTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const FavoriteCommunity())));
                        },
                        title: 'Favorites Community',
                        images: const [
                          'assets/images/comapny_inner_page/review_and_rating_image2.png',
                          'assets/images/comapny_inner_page/review_and_rating_image1.png',
                        ],
                      ),
                      FavoriteTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const FavoriteOffers())));
                        },
                        title: 'Favorites Offers',
                        images: const [
                          'assets/images/main_page/home_page/offers_tab/1.png',
                          'assets/images/main_page/home_page/offers_tab/2.png',
                          'assets/images/main_page/home_page/offers_tab/3.png',
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteTile extends StatelessWidget {
  const FavoriteTile({
    Key? key,
    required this.title,
    required this.images,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  final List<String> images;

  List<Widget> _buildImages() {
    List<Widget> img = [];
    img.addAll(images
        .take(3)
        .map(
          (e) => Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: (e.trim().startsWith('http'))
                    ? NetworkImage(e) as ImageProvider
                    : AssetImage(e),
              ),
            ),
          ),
        )
        .toList());
    return img;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(
            left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 10),
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              recBkg,
            ),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      ..._buildImages(),
                      if (images.isNotEmpty)
                        Container(
                          width: 28,
                          height: 28,
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Image(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                'assets/images/comapny_inner_page/more.png',
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.arrow_forward,
                size: 20,
                color: Color(InstaDaleelColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
