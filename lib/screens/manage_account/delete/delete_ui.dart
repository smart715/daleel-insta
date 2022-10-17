import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_daleel/global_members.dart';
import '../../../../constants/colors.dart';
import '../../../widgets/sign_in_and_sign_up_text_field.dart';

class DeleteTicket extends StatefulWidget {
  const DeleteTicket({Key? key}) : super(key: key);

  static const String deleteTicketRoute = 'DeleteTicket';

  @override
  State<DeleteTicket> createState() => _DeleteTicketState();
}

class _DeleteTicketState extends State<DeleteTicket> {
  File? pickedFile;
  List<String> options = const [
    'I have another account',
    'I am having a personal problem',
    'I am moving to another country',
    'Not getting it clear',
    'I am having a personal problem',
  ];
  int currentIndex = -1;
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
                  'Delete Reason',
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
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              textAlign: TextAlign.end,
              text: const TextSpan(
                text:
                    'Please Choose A Reason Why You Want To Delete Your Account and Describe The Reason In Details If possible.',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xffB1B1B1),
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
                    CustomSupportDialog(
                      currentIndex: currentIndex,
                      hintText: currentIndex != -1
                          ? options[currentIndex]
                          : 'Please Choose Your Reason',
                      options: options,
                      onChange: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                    ),
                    TextAreaTextField(
                      hintText: 'Type here',
                      labelText: 'Message',
                      maxLines: 10,
                      height: 150,
                      alignRight: true,
                      textEditingController: TextEditingController(),
                      validator: (value) {
                        return null;
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
                                'Confirm',
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
