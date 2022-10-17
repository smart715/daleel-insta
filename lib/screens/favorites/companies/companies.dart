import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/company/company_widgets/company_card_display.dart';
import 'package:insta_daleel/screens/main_page/featured_page/featured_page_widgets/featured_company_rating_card.dart';
import 'package:insta_daleel/screens/main_page/search_widget.dart';
import '../../../constants/colors.dart';

class ShowCategoriesCompanies extends StatefulWidget {
  const ShowCategoriesCompanies({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);
  final String id;
  final String name;

  @override
  State<ShowCategoriesCompanies> createState() =>
      _ShowCategoriesCompaniesState();
}

class _ShowCategoriesCompaniesState extends State<ShowCategoriesCompanies> {
  List<FeaturedCompanyRatingCardModel> featuredCompanyRatingCardModelList = [
    FeaturedCompanyRatingCardModel(
      onTap: () {},
      title: 'Software & Solutions',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath: 'assets/images/main_page/featured_page/1.png',
      rating: 4.0,
    ),
    FeaturedCompanyRatingCardModel(
      onTap: () {},
      title: 'Global Architecture',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath: 'assets/images/main_page/featured_page/2.png',
      rating: 5.0,
    ),
    FeaturedCompanyRatingCardModel(
      onTap: () {},
      title: 'Infotech Systems',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath: 'assets/images/main_page/featured_page/3.png',
      rating: 5.0,
    ),
    FeaturedCompanyRatingCardModel(
      onTap: () {},
      title: 'Infosys System And Co',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath: 'assets/images/main_page/featured_page/4.png',
      rating: 4.0,
    ),
    FeaturedCompanyRatingCardModel(
      onTap: () {},
      title: 'IDEA TECH Services',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath: 'assets/images/main_page/featured_page/5.png',
      rating: 5.0,
    ),
  ];

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
                'Favorite Companies',
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
        const SizedBox(
          height: 15,
        ),
        Text(
          'Showing Result For ${widget.name}',
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xffB1B1B1),
          ),
        ),
        // body
        Expanded(
          child:
              // rating cards
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: RefreshIndicator(
              onRefresh: () async {
                Future.delayed(const Duration(seconds: 1));
              },
              child: ListView.builder(
                itemCount: featuredCompanyRatingCardModelList.length * 2,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index.isOdd) {
                    return const SizedBox(
                      height: 10,
                    );
                  }
                  int i = index ~/ 2;
                  final c = featuredCompanyRatingCardModelList[i];
                  return CompanyDisplayCard(
                    isFeatured: true,
                    title: c.title,
                    description: c.description,
                    image: c.imageAssetPath,
                    rating: c.rating,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
