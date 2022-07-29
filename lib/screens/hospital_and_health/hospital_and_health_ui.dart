import 'package:flutter/material.dart';
import 'package:insta_daleel/screens/shopping_malls/shopping_malls_widgets/shopping_malls_card.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';
import 'hospital_and_health_widgets/hospital_and_health_card.dart';

class HospitalAndHealth extends StatefulWidget {
  const HospitalAndHealth({Key? key}) : super(key: key);
  static const String hospitalAndHealthRoute = 'HospitalAndHealth';

  @override
  State<HospitalAndHealth> createState() => _HospitalAndHealthState();
}

class _HospitalAndHealthState extends State<HospitalAndHealth> {


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
                'Hospital and Health',
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
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'Hospital\n& Health\nCenter',
                          imagePath: 'assets/images/health_and_care/hospital_health_center.png',
                        ),
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'All\nCategories',
                          imagePath: 'assets/images/health_and_care/all_categories.png',
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
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'Diseases\nClinic\nGynecology',
                          imagePath: 'assets/images/health_and_care/female.png',
                        ),
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'Children\nClinic',
                          imagePath: 'assets/images/health_and_care/child.png',
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
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'Dermatology\n& Genitals',
                          imagePath: 'assets/images/health_and_care/hand_open.png',
                        ),
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'Cardiology\n& Medicine',
                          imagePath: 'assets/images/health_and_care/balloon_heart.png',
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
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'Neurosurgery\n& Spine',
                          imagePath: 'assets/images/health_and_care/brain.png',
                        ),
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'Eyes &\nOptics',
                          imagePath: 'assets/images/health_and_care/eye.png',
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
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'Nose, Ear\n& Throat',
                          imagePath: 'assets/images/health_and_care/ear.png',
                        ),
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'X-ray &\nLaboratories',
                          imagePath: 'assets/images/health_and_care/x_ray_scan.png',
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
                        HospitalAndHealthCard(
                          onTap: (){},
                          title: 'General\nLaboratories',
                          imagePath: 'assets/images/health_and_care/injection.png',
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
