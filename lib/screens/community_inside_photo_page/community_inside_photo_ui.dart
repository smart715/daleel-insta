import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../global_members.dart';

class CommunityInsidePhotoPage extends StatefulWidget {
  const CommunityInsidePhotoPage({Key? key}) : super(key: key);

  static const String communityInsidePhotoRoute = 'CommunityInsidePhotoPage';

  @override
  State<CommunityInsidePhotoPage> createState() => _CommunityInsidePhotoPageState();
}

class _CommunityInsidePhotoPageState extends State<CommunityInsidePhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App bar
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
                'Insta Daleel',
                style: TextStyle(
                    color: Color(InstaDaleelColors.primaryColor),
                    fontSize: 18,
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
                    onTap: () {

                    },
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/main_page/app_bar/main_screen_appbar_notification_icon.png'
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                    },
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/main_page/app_bar/main_screen_appbar_help_info_icon.png'
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        //body
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 15,bottom: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // name and profile pic
                    Container(
                      height: 80,
                      padding: const EdgeInsets.only(right: leftRightGlobalMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'Karim Shaikh',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Color(InstaDaleelColors.primaryColor),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
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
                                image: AssetImage(
                                  'assets/images/main_page/home_page/community_tab/dp3.png',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // description
                    Container(
                      height: 120,
                      padding: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin),
                        child: const SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet .......Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet .......amet nullam sagittis malesuada. amet nullam sagittis malesuada. ',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.black, fontSize: 13),
                          ),
                        ),
                      ),

                    // background image
                    Container(
                      margin: const EdgeInsets.only(right: leftRightGlobalMargin, left: leftRightGlobalMargin),
                      // height: 200, // it was given
                      child: const Image(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/main_page/home_page/community_tab/bg1.png',
                        ),
                      ),
                    ),

                    // like
                    GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: leftRightGlobalMargin * 2),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          SizedBox(width: 5,),
                            Text(
                              'Like',
                              style: TextStyle(
                                color: Color(0xFFB1B1B1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Divider
                    const Divider(
                      color: Color(0xFFB1B1B1),
                      thickness: 1,
                      height: 0,
                    ),

                    // you and 3 others
                    GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: leftRightGlobalMargin * 2),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'You and 3 others',
                              style: TextStyle(
                                color: Color(0xFFB1B1B1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // comment here text field
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: leftRightGlobalMargin),
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  // controller: textEditingController,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      hintText: 'Comment here',
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
                                color: Color(InstaDaleelColors.primaryColor),
                                thickness: 0.5,
                                indent: 8,
                                endIndent: 8,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(right: 20, left: 10),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Color(InstaDaleelColors.primaryColor),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),

                    // small card 1
                    Container(
                        margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 15,bottom: 5),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text(
                                      'Sayma Arsha',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        color: Color(InstaDaleelColors.primaryColor),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                        'assets/images/main_page/home_page/community_tab/dp2.png',
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 60,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet  nullam sagittis malesuada.',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )),

                    // small card 2
                    Container(
                        margin: const EdgeInsets.only(left: leftRightGlobalMargin, right: leftRightGlobalMargin, top: 15,bottom: 5),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text(
                                      'Karim Shaikh',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        color: Color(InstaDaleelColors.primaryColor),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/main_page/home_page/community_tab/dp5.png',
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 60,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet  nullam sagittis malesuada.',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
