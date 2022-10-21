import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_daleel/domain/entities/history_note.dart';
import 'package:insta_daleel/domain/entities/user_profile.dart';
import 'package:insta_daleel/domain/repositories/repository.dart';
import 'package:insta_daleel/screens/add_events/add_new_event.dart';
import 'package:insta_daleel/screens/advert_request/add_new_advert.dart';
import 'package:insta_daleel/screens/favorites/favorite_screen.dart';
import 'package:insta_daleel/screens/profile_page/profile_page_behavior.dart';
import 'package:insta_daleel/screens/profile_page/profile_page_widgets/your_balance_dialog.dart';
import 'package:insta_daleel/screens/profile_page/profile_state_controller.dart';
import 'package:insta_daleel/screens/sign_in/sign_in_ui.dart';
import 'package:insta_daleel/screens/support/support_ui.dart';
import 'package:insta_daleel/service_locator.dart';
import '../../../constants/colors.dart';
import '../../../global_members.dart';
import '../main_page/home_page/home_page_ui.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String profilePageRoute = 'ProfilePage';

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage>
    with ProfilePageBehavior {
  // late UserProfile profile;
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
    final profileNotifier = ref.watch(profileStateProvider);
    UserProfile profile = profileNotifier.profile;
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                recBkg,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          150,
                                      child: Text(
                                        '${profile.nickName ?? profile.firstName}',
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
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        profile.profileImage != null
                                            ? profile.profileImage!
                                            : 'https://www.freeiconspng.com/uploads/profile-icon-1.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            recBkg,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(15),
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
                                        text: '0',
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FavoriteScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(
                          left: leftRightGlobalMargin,
                          right: leftRightGlobalMargin,
                          top: 10),
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
                          const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'My Favorites',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Image(
                                    height: 25,
                                    image: AssetImage(
                                      'assets/images/profile_page/7.png',
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddNewEvent()));
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
                              top: 10),
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddNewAdvert()));
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
                              top: 10),
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'Advertisement Request',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Image(
                                  height: 25,
                                  image: AssetImage(
                                    'assets/images/profile_page/6.png',
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SupportTicket()));
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
                              top: 10),
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .popUntil((Route<dynamic> route) => false);
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).push(MaterialPageRoute(
                          builder: (context) => const SignIn()));
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
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            recBkg,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(15),
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
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
