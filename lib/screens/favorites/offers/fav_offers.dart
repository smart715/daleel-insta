import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/offers/offers_tab_widgets/offers_tab_card.dart';
import 'package:insta_daleel/screens/main_page/search_widget.dart';

class FavoriteOffers extends StatefulWidget {
  const FavoriteOffers({Key? key}) : super(key: key);

  @override
  State<FavoriteOffers> createState() => _FavoriteOffersState();
}

class _FavoriteOffersState extends State<FavoriteOffers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //app bar
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
                'Favorite Offers',
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
        //search view
        const SizedBox(
          height: 20,
        ),
        SearchWidget(
          onChanged: (searchedText) {
            debugPrint("Search of $searchedText");
          },
        ),
        // const SizedBox(
        //   height: 15,
        // ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                OffersTabCard(
                  isActive: false,
                  isFeatured: true,
                  offersTabCardModel: OffersTabCardModel(
                    onTap: () {
                      Navigator.pushNamed(context, 'OfferDetails');
                    },
                    title:
                        '10 % Discount On All Product Purchasing From The Shop',
                    description: 'Lorem ipsum dolor sit amet, consectetur ',
                    imageAssetPath:
                        'assets/images/main_page/home_page/offers_tab/1.png',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OffersTabCard(
                  isFeatured: true,
                  offersTabCardModel: OffersTabCardModel(
                    onTap: () {
                      Navigator.pushNamed(context, 'OfferDetails');
                    },
                    title: 'Only 56 USD on all product this Friday',
                    description: 'Lorem ipsum dolor sit amet, consectetur ',
                    imageAssetPath:
                        'assets/images/main_page/home_page/offers_tab/2.png',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OffersTabCard(
                  offersTabCardModel: OffersTabCardModel(
                    onTap: () {
                      Navigator.pushNamed(context, 'OfferDetails');
                    },
                    title: '10 Years Service Free On All SUV and Other Cars',
                    description: 'Lorem ipsum dolor sit amet, consectetur ',
                    imageAssetPath:
                        'assets/images/main_page/home_page/offers_tab/3.png',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OffersTabCard(
                  offersTabCardModel: OffersTabCardModel(
                    onTap: () {
                      Navigator.pushNamed(context, 'OfferDetails');
                    },
                    title: 'Buy One Get One only at 14 AED At BurgerKing',
                    description: 'Lorem ipsum dolor sit amet, consectetur ',
                    imageAssetPath:
                        'assets/images/main_page/home_page/offers_tab/4.png',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OffersTabCard(
                  offersTabCardModel: OffersTabCardModel(
                    onTap: () {
                      Navigator.pushNamed(context, 'OfferDetails');
                    },
                    title:
                        'Get The Best Car for your at the best price of 5000 !',
                    description: 'Lorem ipsum dolor sit amet, consectetur ',
                    imageAssetPath:
                        'assets/images/main_page/home_page/offers_tab/5.png',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OffersTabCard(
                  offersTabCardModel: OffersTabCardModel(
                    onTap: () {
                      Navigator.pushNamed(context, 'OfferDetails');
                    },
                    title: 'Buy Two Get One only at 14 AED At KFC DUBAI',
                    description: 'Lorem ipsum dolor sit amet, consectetur ',
                    imageAssetPath:
                        'assets/images/main_page/home_page/offers_tab/6.png',
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
