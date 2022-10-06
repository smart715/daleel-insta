import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_daleel/domain/entities/history_note.dart';
import 'package:insta_daleel/domain/repositories/repository.dart';
import 'package:insta_daleel/screens/profile_page/profile_page_behavior.dart';
import 'package:insta_daleel/screens/profile_page/profile_page_widgets/your_balance_dialog.dart';
import 'package:insta_daleel/service_locator.dart';
import '../../../constants/colors.dart';
import '../../../global_members.dart';
import '../main_page/home_page/home_page_ui.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String profilePageRoute = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfilePageBehavior {
  List<HistoryNote> historyList = [];
  double totalCoin = 0;
  @override
  void initState() {
    ProfilePageBehavior.setStateProfilePage = () {
      print('set state called');
      setState(() {});
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: Column(
        children: [
          // app bar
          SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  HomePageProfilePic.setStateHomePageProfilePic();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(InstaDaleelColors.primaryColor),
                ),
              ),
              title: const Center(
                child: Text(
                  'Profile',
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

          //body
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'EditProfile');
                    },
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              left: leftRightGlobalMargin,
                              right: leftRightGlobalMargin,
                              top: 10),
                          decoration: BoxDecoration(
                            color: const Color(InstaDaleelColors.primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 150,
                                    child: Text(
                                      userName,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Edit Your Profile',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 10, left: 10),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      userProfilePicLink != null
                                          ? userProfilePicLink!
                                          : 'https://www.freeiconspng.com/uploads/profile-icon-1.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          left: 20,
                          top: 43,
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return showBalanceDialog(context, historyList);
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: leftRightGlobalMargin,
                          right: leftRightGlobalMargin,
                          top: 10),
                      decoration: BoxDecoration(
                        color: const Color(InstaDaleelColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FutureBuilder(
                              future: serviceLocator<Repository>().getHistory(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final h = snapshot.data ?? [];
                                  historyList.clear();
                                  historyList.addAll(h);
                                  if (h.isEmpty) {
                                    totalCoin = 0;
                                  } else {
                                    totalCoin = h
                                        .map((e) => e.amount)
                                        .reduce((a, b) => a + b);
                                  }
                                  return RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                        text: 'Your Coins : ',
                                      ),
                                      TextSpan(
                                        text: '$totalCoin',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                                  );
                                }
                                if (snapshot.hasError) {
                                  return RichText(
                                    text: const TextSpan(children: [
                                      TextSpan(
                                        text: 'Your Coins : ',
                                      ),
                                      TextSpan(
                                        text: 'ERROR',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                                  );
                                }

                                return const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                );
                              }),
                          const Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: Image(
                              height: 25,
                              image: AssetImage(
                                'assets/images/profile_page/1.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'ManageAccount');
                    },
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                            left: leftRightGlobalMargin,
                            right: leftRightGlobalMargin,
                            top: 10,
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                profileBtnBkg,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'Manage my account',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Image(
                                  height: 25,
                                  image: AssetImage(
                                    'assets/images/profile_page/2.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          left: 20,
                          top: 31,
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: leftRightGlobalMargin,
                            right: leftRightGlobalMargin,
                            top: 10),
                        decoration: BoxDecoration(
                          color: const Color(InstaDaleelColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Add Events',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: Image(
                                height: 25,
                                image: AssetImage(
                                  'assets/images/profile_page/3.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        top: 31,
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: leftRightGlobalMargin,
                            right: leftRightGlobalMargin,
                            top: 10),
                        decoration: BoxDecoration(
                          color: const Color(InstaDaleelColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              ' Support',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: Image(
                                height: 25,
                                image: AssetImage(
                                  'assets/images/profile_page/4.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        top: 31,
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: leftRightGlobalMargin,
                        right: leftRightGlobalMargin,
                        top: 10),
                    decoration: BoxDecoration(
                      color: const Color(InstaDaleelColors.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Image(
                            height: 25,
                            image: AssetImage(
                              'assets/images/profile_page/5.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
