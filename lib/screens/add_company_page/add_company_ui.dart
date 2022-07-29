import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../widgets/sign_in_and_sign_up_text_field.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({Key? key}) : super(key: key);

  static const String addCompanyRoute = 'AddCompany';

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {

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
                'Add Company',
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
                      hintText: 'Name here',
                      labelText: 'Company\nName',
                      textEditingController: TextEditingController(),
                      validator: (value) {},
                    ),

                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Address',
                      textEditingController: TextEditingController(),
                      validator: (value) {},
                    ),

                    GestureDetector(
                      onTap: () {

                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AbsorbPointer(
                            child: SignInAndSignUpTextField(
                              hintText: 'Select City',
                              labelText: 'Town/City',
                              textEditingController: TextEditingController(),
                              validator: (value) {},
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: ((MediaQuery.of(context).size.width)/2) + 5,
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Contact\nNumber',
                      textEditingController: TextEditingController(),
                      validator: (value) {},
                    ),

                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Website',
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
                      labelText: 'Whats App',
                      textEditingController: TextEditingController(),
                      validator: (value) {},
                    ),

                    SignInAndSignUpTextField(
                      hintText: 'Type here',
                      labelText: 'Instagram\nAccount',
                      textEditingController: TextEditingController(),
                      validator: (value) {},
                    ),

                    SizedBox(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width - 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(InstaDaleelColors.primaryColor)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Add Company Logo',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.add_circle_outline_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
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
                              'Submit',
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
