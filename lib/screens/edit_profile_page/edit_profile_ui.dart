import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../widgets/sign_in_and_sign_up_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  static const String editProfileRoute = 'EditProfile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  int groupValue = 0;

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
                'Edit Profile',
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
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(40),
                    elevation: 5.0,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/main_page/app_bar/dp_to_delete.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  // change photo button
                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                        height: 38,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(InstaDaleelColors.primaryColor)
                        ),
                        child: const Center(
                          child: Text(
                            'Change Photo',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SignInAndSignUpTextField(
                    hintText: 'Name here',
                    labelText: 'Name',
                    textEditingController: TextEditingController(),
                    validator: (value) {},
                  ),

                  SignInAndSignUpTextField(
                    hintText: 'Type here',
                    labelText: 'About me',
                    textEditingController: TextEditingController(),
                    validator: (value) {},
                  ),

                  SignInAndSignUpTextField(
                    hintText: 'Type here',
                    labelText: 'Contact\nNumber',
                    textEditingController: TextEditingController(),
                    validator: (value) {},
                  ),

                  SignInAndSignUpTextField(
                    hintText: 'Type here',
                    labelText: 'Live in',
                    textEditingController: TextEditingController(),
                    validator: (value) {},
                  ),

                  SignInAndSignUpTextField(
                    hintText: 'Type here',
                    labelText: 'Email\nAddress',
                    textEditingController: TextEditingController(),
                    validator: (value) {},
                  ),

                  SignInAndSignUpTextField(
                    hintText: 'Type here',
                    labelText: 'Occupation',
                    textEditingController: TextEditingController(),
                    validator: (value) {},
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              groupValue: groupValue,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                              activeColor: const Color(InstaDaleelColors.primaryColor),
                              onChanged: (int? value) {
                                setState(() {
                                  groupValue = value!;
                                });
                              },
                              title: const Text(
                                'Male',
                                style: TextStyle(
                                  color: Color(InstaDaleelColors.primaryColor),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 0,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: const Color(InstaDaleelColors.primaryColor),
                              groupValue: groupValue,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                              onChanged: (int? value) {
                                setState(() {
                                  groupValue = value!;
                                });
                              },
                              title: const Text(
                                'Female',
                                style: TextStyle(
                                  color: Color(InstaDaleelColors.primaryColor),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(InstaDaleelColors.primaryColor)
                        ),
                        child: const Center(
                          child: Text(
                            'Save Data',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
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
