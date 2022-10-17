import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/main_page/settings_page/settings_page_widgets/settings_tile.dart';
import 'package:insta_daleel/screens/main_page/settings_page/settings_page_widgets/social_media_avatar.dart';

import '../../../constants/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // app bar
        SizedBox(
          height: 70,
          child: ListTile(
            leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(InstaDaleelColors.primaryColor),
              ),
            ),
            title: const Center(
              child: Text(
                'Who Are We',
                style: TextStyle(
                    color: Color(InstaDaleelColors.primaryColor),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            trailing: const SizedBox(
              height: 45,
            ),
          ),
        ),

        //body
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
              child: Column(
                children: [
                  SettingsTile(
                    title: 'About the guide',
                    onTap: () {},
                    imageIcon: 'assets/images/main_page/settings_page/1.png',
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  SettingsTile(
                    title: 'Terms and Conditions',
                    onTap: () {},
                    imageIcon: 'assets/images/main_page/settings_page/2.png',
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  SettingsTile(
                    title: 'Guide joining policy',
                    onTap: () {},
                    imageIcon: 'assets/images/main_page/settings_page/3.png',
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  SettingsTile(
                    title: 'How to add a new place',
                    onTap: () {},
                    imageIcon: 'assets/images/main_page/settings_page/4.png',
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  SettingsTile(
                    title:
                        'How to Propose to modify the data of a\nplace and service',
                    onTap: () {},
                    imageIcon: 'assets/images/main_page/settings_page/5.png',
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  SettingsTile(
                    title: 'Go to the website',
                    onTap: () {},
                    imageIcon: 'assets/images/main_page/settings_page/6.png',
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  SettingsTile(
                    title: 'Share the app',
                    onTap: () {},
                    imageIcon: 'assets/images/main_page/settings_page/7.png',
                  ),

                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 60,
                  //   width: MediaQuery.of(context).size.width,
                  //   margin: const EdgeInsets.only(
                  //       left: leftRightGlobalMargin,
                  //       right: leftRightGlobalMargin,
                  //       top: 10),
                  //   decoration: BoxDecoration(
                  //     color: const Color(InstaDaleelColors.primaryColor),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: const [
                  //       Text(
                  //         'Guide joining policy',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(right: 20, left: 20),
                  //         child: Image(
                  //           height: 25,
                  //           image: AssetImage(
                  //             'assets/images/main_page/settings_page/3.png',
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 60,
                  //   width: MediaQuery.of(context).size.width,
                  //   margin: const EdgeInsets.only(
                  //       left: leftRightGlobalMargin,
                  //       right: leftRightGlobalMargin,
                  //       top: 10),
                  //   decoration: BoxDecoration(
                  //     color: const Color(InstaDaleelColors.primaryColor),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: const [
                  //       Text(
                  //         'How to add a new place',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(right: 20, left: 20),
                  //         child: Image(
                  //           height: 25,
                  //           image: AssetImage(
                  //             'assets/images/main_page/settings_page/4.png',
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 60,
                  //   width: MediaQuery.of(context).size.width,
                  //   margin: const EdgeInsets.only(
                  //       left: leftRightGlobalMargin,
                  //       right: leftRightGlobalMargin,
                  //       top: 10),
                  //   decoration: BoxDecoration(
                  //     color: const Color(InstaDaleelColors.primaryColor),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: const [
                  //       Text(
                  //         'How to Propose to modify the data of a\nplace and service',
                  //         textAlign: TextAlign.end,
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(right: 20, left: 20),
                  //         child: Image(
                  //           height: 25,
                  //           image: AssetImage(
                  //             'assets/images/main_page/settings_page/5.png',
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 60,
                  //   width: MediaQuery.of(context).size.width,
                  //   margin: const EdgeInsets.only(
                  //       left: leftRightGlobalMargin,
                  //       right: leftRightGlobalMargin,
                  //       top: 10),
                  //   decoration: BoxDecoration(
                  //     color: const Color(InstaDaleelColors.primaryColor),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: const [
                  //       Text(
                  //         'Go to the website',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(right: 20, left: 20),
                  //         child: Image(
                  //           height: 25,
                  //           image: AssetImage(
                  //             'assets/images/main_page/settings_page/6.png',
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 60,
                  //   width: MediaQuery.of(context).size.width,
                  //   margin: const EdgeInsets.only(
                  //       left: leftRightGlobalMargin,
                  //       right: leftRightGlobalMargin,
                  //       top: 10),
                  //   decoration: BoxDecoration(
                  //     color: const Color(InstaDaleelColors.primaryColor),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: const [
                  //       Text(
                  //         'Share the app',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(right: 20, left: 20),
                  //         child: Image(
                  //           height: 25,
                  //           image: AssetImage(
                  //             'assets/images/main_page/settings_page/7.png',
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // 'Follow us' text
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    child: const Text(
                      'Follow us on :',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(InstaDaleelColors.primaryColor)),
                    ),
                  ),

                  // social  media account section
                  SizedBox(
                    height: 60,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SocialMediaAvatar(
                            onTap: () {},
                            iconPath:
                                'assets/images/comapny_inner_page/instagram_account.png',
                          ),
                          SocialMediaAvatar(
                            onTap: () {},
                            iconPath:
                                'assets/images/comapny_inner_page/twitter.png',
                          ),
                          SocialMediaAvatar(
                            onTap: () {},
                            iconPath:
                                'assets/images/comapny_inner_page/facebook.png',
                          ),
                          SocialMediaAvatar(
                            onTap: () {},
                            iconPath:
                                'assets/images/comapny_inner_page/youtube.png',
                          ),
                          SocialMediaAvatar(
                            onTap: () {},
                            iconPath:
                                'assets/images/comapny_inner_page/telegram.png',
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 'contact us directly' text
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    child: const Text(
                      'Or you can contact us directly via the following\nemail form :',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(InstaDaleelColors.primaryColor),
                        fontSize: 12,
                      ),
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
