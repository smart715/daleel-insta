import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_daleel/global_members.dart';
import '../../../../constants/colors.dart';
import '../../../widgets/sign_in_and_sign_up_text_field.dart';

class AddNewEvent extends StatefulWidget {
  const AddNewEvent({Key? key}) : super(key: key);

  static const String addNewEventRoute = 'AddNewEvent';

  @override
  State<AddNewEvent> createState() => _AddNewEventState();
}

class _AddNewEventState extends State<AddNewEvent> {
  File? pickedFile;
  String? selectedCity;
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
                  'Add New Event',
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ImagePickerTextField(
                      hintText: 'Type here',
                      labelText: 'Image',
                      pickedImage: pickedFile,
                      onChange: (file) {
                        setState(() {
                          if (file != null) {
                            pickedFile = File(file.path);
                          }
                        });
                      },
                    ),
                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Name of\nthe event',
                      textEditingController: TextEditingController(),
                      validator: (value) {
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Event\nLocation',
                      textEditingController: TextEditingController(),
                      validator: (value) {
                        return null;
                      },
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Stack(
                    //     alignment: Alignment.center,
                    //     children: [
                    //       AbsorbPointer(
                    //         child: SignInAndSignUpTextField(
                    //           hintText: 'Select City',
                    //           labelText: 'Town/City',
                    //           textEditingController: TextEditingController(),
                    //           validator: (value) {
                    //             return null;
                    //           },
                    //         ),
                    //       ),
                    //       Positioned(
                    //         top: 20,
                    //         right:
                    //             ((MediaQuery.of(context).size.width) / 2) + 5,
                    //         child: const Icon(
                    //           Icons.keyboard_arrow_down_outlined,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    CityTile(
                      title: 'Select City',
                      labelText: 'Town/City',
                      selectedCity: selectedCity,
                      onSelect: (city) {
                        setState(() {
                          selectedCity = city;
                        });
                      },
                    ),
                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Contact\nNumber',
                      textEditingController: TextEditingController(),
                      validator: (value) {
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Time',
                      textEditingController: TextEditingController(),
                      validator: (value) {
                        return null;
                      },
                    ),
                    TextAreaTextField(
                      hintText: 'Type here',
                      labelText: 'Details',
                      alignRight: true,
                      textEditingController: TextEditingController(),
                      validator: (value) {
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      hintText: 'Type Link here',
                      labelText: 'Website',
                      textEditingController: TextEditingController(),
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 250,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/comapny_inner_page/map_sq.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 75,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(submitBtnBkg),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CityTile extends StatefulWidget {
  const CityTile({
    Key? key,
    required this.title,
    required this.labelText,
    required this.onSelect,
    this.selectedCity,
  }) : super(key: key);
  final String title;
  final String labelText;
  final String? selectedCity;
  final Function(String val) onSelect;

  @override
  State<CityTile> createState() => _CityTileState();
}

class _CityTileState extends State<CityTile> {
  double bannerHeight = 50;
  double bannerBorderRadius = 25;
  double cityTileHeight = 25;
  bool isActive = false;
  late List<Widget> tiles;
  @override
  void initState() {
    super.initState();
    tiles = [
      'All',
      'Dubia',
      'Abu Dhabi',
      'Sharjah',
      'Ajman',
      'Hatta',
      'Jebel Ali'
    ].map(
      (e) {
        return SizedBox(
          // height: cityTileHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isActive = !isActive;
                  });
                  widget.onSelect(e);
                },
                child: Container(
                  height: cityTileHeight,
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.5),
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (e != 'Jebel Ali')
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: const Divider(
                    thickness: 0.7,
                    height: 2,
                    color: Color(0xffE0E0E0),
                  ),
                ),
            ],
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(bannerBorderRadius),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isActive
                ? bannerHeight + (10 * cityTileHeight) + 10
                : bannerHeight,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  top: bannerHeight,
                  left: 0,
                  child: SizedBox(
                    height: 10 * cityTileHeight,
                    width: MediaQuery.of(context).size.width - 30,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: tiles,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(bannerBorderRadius),
                  child: Container(
                    alignment: Alignment.center,
                    height: bannerHeight,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(buttonBkg),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  isActive
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  widget.selectedCity ?? widget.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 0.5,
                              indent: 8,
                              endIndent: 8,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 10),
                            child: Text(
                              widget.labelText,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
