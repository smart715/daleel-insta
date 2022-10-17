import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/community/community_tab_widgets/community_tab_small_card.dart';
import 'package:insta_daleel/screens/main_page/home_page/tabs/offers/offers_tab_widgets/offers_tab_card.dart';
import 'package:insta_daleel/screens/main_page/search_widget.dart';

class FavoriteCommunity extends StatefulWidget {
  const FavoriteCommunity({Key? key}) : super(key: key);

  @override
  State<FavoriteCommunity> createState() => _FavoriteCommunityState();
}

class _FavoriteCommunityState extends State<FavoriteCommunity> {
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
                'Favorite Community',
                style: TextStyle(
                  color: Color(InstaDaleelColors.primaryColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
              children: const [
                CommunityPostCard(
                  personName: 'Abdul Rashid',
                  imageUrl:
                      'https://scontent-lhr8-1.xx.fbcdn.net/v/t39.30808-6/311233719_2264720030344593_3533777974738364520_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=_Fda4M2Yb_YAX-fZb1s&_nc_ht=scontent-lhr8-1.xx&oh=00_AT_b1OEOXfeod1Y5Ct7OKxHgMd3kToBcuGI0QF3aMjUXkw&oe=63467267',
                  personProfilePicLink:
                      'https://www.elitesingles.co.uk/wp-content/uploads/sites/59/2019/11/2b_en_articleslide_sm2-350x264.jpg',
                  postText:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet amet nullam sagittis malesuada. ',
                  likesCount: 23,
                  commentsCount: 32,
                  showImage: true,
                  isLiked: false,
                  customerId: -1,
                ),
                SizedBox(
                  height: 10,
                ),
                CommunityPostCard(
                  personName: 'Asko Rashid',
                  personProfilePicLink:
                      'https://www.elitesingles.co.uk/wp-content/uploads/sites/59/2019/11/2b_en_articleslide_sm2-350x264.jpg',
                  postText:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet amet nullam sagittis malesuada. ',
                  likesCount: 23,
                  commentsCount: 32,
                  showImage: true,
                  isLiked: false,
                  customerId: -1,
                ),
                SizedBox(
                  height: 10,
                ),
                CommunityPostCard(
                  personName: 'Abdul Masoud',
                  imageUrl:
                      'https://scontent-lhr8-1.xx.fbcdn.net/v/t39.30808-6/311233719_2264720030344593_3533777974738364520_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=_Fda4M2Yb_YAX-fZb1s&_nc_ht=scontent-lhr8-1.xx&oh=00_AT_b1OEOXfeod1Y5Ct7OKxHgMd3kToBcuGI0QF3aMjUXkw&oe=63467267',
                  personProfilePicLink:
                      'https://www.elitesingles.co.uk/wp-content/uploads/sites/59/2019/11/2b_en_articleslide_sm2-350x264.jpg',
                  postText:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet amet nullam sagittis malesuada. ',
                  likesCount: 23,
                  commentsCount: 32,
                  showImage: true,
                  isLiked: false,
                  customerId: -1,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
