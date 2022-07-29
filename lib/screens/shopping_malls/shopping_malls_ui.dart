import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/shopping_malls/shopping_malls_widgets/shopping_malls_card.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';

class ShoppingMalls extends StatefulWidget {
  const ShoppingMalls({Key? key}) : super(key: key);
  static const String shoppingMallsRoute = 'ShoppingMalls';

  @override
  State<ShoppingMalls> createState() => _ShoppingMallsState();
}

class _ShoppingMallsState extends State<ShoppingMalls> {


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
                'Shopping and Commercial',
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Malls &\nCommercial\nCenters',
                          imagePath: 'assets/images/shopping_malls/malls_commercial_centers.png',
                        ),
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'All\nCategories',
                          imagePath: 'assets/images/shopping_malls/all_categories.png',
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Electronics\n& Electricals',
                          imagePath: 'assets/images/shopping_malls/electronics_electricals.png',
                        ),
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Clothing\nFor Male',
                          imagePath: 'assets/images/shopping_malls/clothing_for_male.png',
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Clothing\nFor Female',
                          imagePath: 'assets/images/shopping_malls/clothing_for_female.png',
                        ),
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Beauty\n& Perfumes',
                          imagePath: 'assets/images/shopping_malls/beauty_perfumes.png',
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Furniture\n& Decoration',
                          imagePath: 'assets/images/shopping_malls/furniture_decoration.png',
                        ),
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Abayas\n& Burqa',
                          imagePath: 'assets/images/shopping_malls/abayas_burqa.png',
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Baby\nClothing',
                          imagePath: 'assets/images/shopping_malls/baby_clothing.png',
                        ),
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Glass &\nAccessoriees',
                          imagePath: 'assets/images/shopping_malls/glass _accessoriees.png',
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15, left: leftRightGlobalMargin, right: leftRightGlobalMargin), // it was 10.0
                          height: 90,
                          width: 160,
                        ),
                        ShoppingMallsCard(
                          onTap: (){},
                          title: 'Gold &\nJewellry',
                          imagePath: 'assets/images/shopping_malls/gold_jewellry.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
