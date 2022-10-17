import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_daleel/global_members.dart';
import '../../../../constants/colors.dart';
import '../../../widgets/sign_in_and_sign_up_text_field.dart';

class AddNewAdvert extends StatefulWidget {
  const AddNewAdvert({Key? key}) : super(key: key);

  static const String addNewAdvertRoute = 'AddNewAdvert';

  @override
  State<AddNewAdvert> createState() => _AddNewAdvertState();
}

class _AddNewAdvertState extends State<AddNewAdvert> {
  File? pickedFile;
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
                  'Advertisement Request',
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
                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Name',
                      textEditingController: TextEditingController(),
                      validator: (value) {
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Number',
                      textEditingController: TextEditingController(),
                      validator: (value) {
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Subject',
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
                                'Send Request',
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
