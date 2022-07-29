import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../global_members.dart';
import 'featured_page_widgets/featured_company_rating_card.dart';

class FeaturedCompanies extends StatefulWidget {
  const FeaturedCompanies({Key? key}) : super(key: key);

  @override
  State<FeaturedCompanies> createState() => _FeaturedCompaniesState();
}

class _FeaturedCompaniesState extends State<FeaturedCompanies> {

  List<FeaturedCompanyRatingCardModel> featuredCompanyRatingCardModelList = [
    FeaturedCompanyRatingCardModel(
      onTap: (){},
      title: 'Software & Solutions',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath: 'assets/images/main_page/featured_page/1.png',
      rating: 4.0,
    ),
    FeaturedCompanyRatingCardModel(
      onTap: (){},
      title: 'Global Architecture',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath: 'assets/images/main_page/featured_page/2.png',
      rating: 5.0,
    ),
    FeaturedCompanyRatingCardModel(
      onTap: (){},
      title: 'Infotech Systems',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath: 'assets/images/main_page/featured_page/3.png',
      rating: 5.0,
    ),
    FeaturedCompanyRatingCardModel(
      onTap: (){},
      title: 'Infosys System And Co',
      description: 'Lorem ipsum dolor sit amet, consectetur ',
      imageAssetPath: 'assets/images/main_page/featured_page/4.png',
      rating: 4.0,
    ),
    FeaturedCompanyRatingCardModel(
      onTap: (){},
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
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Color(InstaDaleelColors.primaryColor),
              ),
            ),
            title: const Center(
              child: Text(
                'Featured Companies',
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
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 10),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      // controller: textEditingController,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          hintText: 'Search Here',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(
                            color: Color(0xFFB1B1B1),
                            fontSize: 13,
                          ),
                          border: InputBorder.none),
                      cursorColor: Color(InstaDaleelColors.primaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: VerticalDivider(
                    color: Color(0xFFB1B1B1),
                    thickness: 0.5,
                    indent: 8,
                    endIndent: 8,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 20, left: 10),
                    child: Image(
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      color: Color(InstaDaleelColors.primaryColor),
                      image: AssetImage(
                          'assets/images/main_page/bottom_navigation_bar/search.png'
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
        // body
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: FeaturedCompanyRatingCard(
                      featuredCompanyRatingCardModel: featuredCompanyRatingCardModelList[0],
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: FeaturedCompanyRatingCard(
                      featuredCompanyRatingCardModel: featuredCompanyRatingCardModelList[1],
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: FeaturedCompanyRatingCard(
                      featuredCompanyRatingCardModel: featuredCompanyRatingCardModelList[2],
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: FeaturedCompanyRatingCard(
                      featuredCompanyRatingCardModel: featuredCompanyRatingCardModelList[3],
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: FeaturedCompanyRatingCard(
                      featuredCompanyRatingCardModel: featuredCompanyRatingCardModelList[4],
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ],
    );
  }
}
