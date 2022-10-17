import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_daleel/domain/entities/company.dart';
import 'package:insta_daleel/global_members.dart';
import 'package:insta_daleel/screens/manage_account/account_page/states/account_notifier.dart';
import 'package:insta_daleel/screens/manage_account/activation_page/activation_page.dart';
import '../../../../constants/colors.dart';

class ManageAccount extends StatefulWidget {
  const ManageAccount({Key? key}) : super(key: key);

  static const String manageAccountRoute = 'ManageAccount';

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: Column(
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
                  'Manage Account',
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
          // body
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Consumer(
                builder: (context, ref, _) {
                  List<Company> companies =
                      ref.watch(accountNotifierProvider).companies;
                  if (companies.isNotEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Center(
                          child: Text(
                            "You've No Added Company",
                            style: TextStyle(
                                color: Color(0xffB1B1B1),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'AddCompany');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Add Company',
                                style: TextStyle(
                                  color: Color(InstaDaleelColors.primaryColor),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.add_circle_outline_rounded,
                                color: Color(InstaDaleelColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return ListView.builder(
                    itemCount: (3 * 2) + 1,
                    itemBuilder: (context, index) {
                      if (index.isOdd && (index + 1) != ((3 * 2) + 1)) {
                        return const SizedBox(
                          height: 3,
                        );
                      }
                      if ((index + 1) == ((3 * 2) + 1)) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'AddCompany');
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: leftRightGlobalMargin + 5,
                              right: leftRightGlobalMargin + 5,
                              top: 20,
                              bottom: 20,
                            ),
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(buttonBkg),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Add Company',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      int i = index ~/ 2;
                      print("index: $i");
                      return CompanyAccountCard(
                          isActive: (i != 2) ? true : false);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyAccountCard extends StatelessWidget {
  final bool isActive;
  const CompanyAccountCard({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        left: leftRightGlobalMargin + 5,
        right: leftRightGlobalMargin + 5,
        top: 10,
      ),
      decoration: isActive
          ? const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  companyCardBkg,
                ),
              ),
            )
          : const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Color(0xffD6D6D6),
            ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Software & Solutions',
                    style: TextStyle(
                      color: isActive ? Colors.white : const Color(0xff444444),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Status : ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: isActive
                                  ? Colors.white
                                  : const Color(0xff444444),
                            ),
                          ),
                          TextSpan(
                            text: isActive ? 'Activated' : 'Deactivated',
                            style: TextStyle(
                              color: isActive
                                  ? const Color(0xff4DFF74)
                                  : const Color(0xffFF2828),
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Expire on: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: isActive
                                  ? Colors.white
                                  : const Color(0xff444444),
                            ),
                          ),
                          TextSpan(
                            text: '22-11-2022',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: isActive
                                  ? Colors.white
                                  : const Color(0xff444444),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    // color:
                                    //     Color(InstaDaleelColors.primaryColor),
                                    color: isActive
                                        ? const Color(
                                            InstaDaleelColors.primaryColor)
                                        : const Color(0xff444444),
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.edit_note_rounded,
                                  size: 15,
                                  color: isActive
                                      ? const Color(
                                          InstaDaleelColors.primaryColor)
                                      : const Color(0xff444444),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ManageActivation(),
                            ),
                          );
                        },
                        child: Container(
                          width: 70,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Manage',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: isActive
                                    ? const Color(
                                        InstaDaleelColors.primaryColor)
                                    : const Color(0xff444444),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 59,
              height: 57,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(userProfilePicLink != null
                      ? userProfilePicLink!
                      : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
