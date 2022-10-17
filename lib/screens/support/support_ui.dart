import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_daleel/global_members.dart';
import '../../../../constants/colors.dart';
import '../../../widgets/sign_in_and_sign_up_text_field.dart';

class SupportTicket extends StatefulWidget {
  const SupportTicket({Key? key}) : super(key: key);

  static const String supportTicketRoute = 'SupportTicket';

  @override
  State<SupportTicket> createState() => _SupportTicketState();
}

class _SupportTicketState extends State<SupportTicket> {
  File? pickedFile;
  List<String> options = const [
    '1 Magna cras interdum consectetur blandit neque.',
    '2 Magna cras interdum consectetur blandit neque.',
    '3 Magna cras interdum consectetur blandit neque.',
    '4 Magna cras interdum consectetur blandit neque.',
    '5 Magna cras interdum consectetur blandit neque.',
    '6 Magna cras interdum consectetur blandit neque.',
    '7 Magna cras interdum consectetur blandit neque.',
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
                  'Support',
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
                text: 'Welcome to ',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xffB1B1B1),
                ),
                children: [
                  TextSpan(
                    text: 'Insta Daleel',
                    style: TextStyle(
                      color: Color(
                        InstaDaleelColors.primaryColor,
                      ),
                    ),
                  ),
                  TextSpan(
                      text:
                          'Support System! Please Enter The Details Below To Create A Ticket And We’ll Get Back To You Soon.')
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
                  children: [
                    CustomSupportDialog(
                      currentIndex: currentIndex,
                      hintText: currentIndex != -1
                          ? options[currentIndex]
                          : 'What Do You Want To Talk About?',
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
                    Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      height: 60,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(buttonBkg),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Attach Any File',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Transform.rotate(
                            angle: 45,
                            child: const Icon(
                              Icons.attach_file,
                              color: Colors.white,
                              size: 18,
                            ),
                          )
                        ],
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
                                'Create Ticket',
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
