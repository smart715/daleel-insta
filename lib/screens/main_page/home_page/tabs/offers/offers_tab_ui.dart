import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/offers/offers_tab_widgets/offers_tab_card.dart';

class OffersTab extends StatefulWidget {
  const OffersTab({Key? key}) : super(key: key);

  @override
  State<OffersTab> createState() => _OffersTabState();
}

class _OffersTabState extends State<OffersTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: OffersTabCard(
              offersTabCardModel: OffersTabCardModel(
                onTap: (){},
                title: '10 % Discount On All Product Purchasing From The Shop',
                description: 'Lorem ipsum dolor sit amet, consectetur ',
                imageAssetPath: 'assets/images/main_page/home_page/offers_tab/1.png',
              ),
            ),
          ),
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: OffersTabCard(
              offersTabCardModel: OffersTabCardModel(
                onTap: (){},
                title: 'Only 56 USD on all product this Friday',
                description: 'Lorem ipsum dolor sit amet, consectetur ',
                imageAssetPath: 'assets/images/main_page/home_page/offers_tab/2.png',
              ),
            ),
          ),
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: OffersTabCard(
              offersTabCardModel: OffersTabCardModel(
                onTap: (){
                  Navigator.pushNamed(context, 'OfferDetails');
                },
                title: '10 Years Service Free On All SUV and Other Cars',
                description: 'Lorem ipsum dolor sit amet, consectetur ',
                imageAssetPath: 'assets/images/main_page/home_page/offers_tab/3.png',
              ),
            ),
          ),
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: OffersTabCard(
              offersTabCardModel: OffersTabCardModel(
                onTap: (){},
                title: 'Buy One Get One only at 14 AED At BurgerKing',
                description: 'Lorem ipsum dolor sit amet, consectetur ',
                imageAssetPath: 'assets/images/main_page/home_page/offers_tab/4.png',
              ),
            ),
          ),
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: OffersTabCard(
              offersTabCardModel: OffersTabCardModel(
                onTap: (){},
                title: 'Get The Best Car for your at the best price of 5000 !',
                description: 'Lorem ipsum dolor sit amet, consectetur ',
                imageAssetPath: 'assets/images/main_page/home_page/offers_tab/5.png',
              ),
            ),
          ),
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: OffersTabCard(
              offersTabCardModel: OffersTabCardModel(
                onTap: (){},
                title: 'Buy Two Get One only at 14 AED At KFC DUBAI',
                description: 'Lorem ipsum dolor sit amet, consectetur ',
                imageAssetPath: 'assets/images/main_page/home_page/offers_tab/6.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
