import 'package:flutter/material.dart';

import '../global_members.dart';

class SignInAndSignUpTextField extends StatelessWidget {
  const SignInAndSignUpTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.textEditingController,
      this.isObscureText = false,
      required this.validator,
      this.textInputType})
      : super(key: key);

  final String labelText, hintText;
  final TextEditingController textEditingController;
  final bool isObscureText;
  final Validator validator;
  final TextInputType? textInputType;
  // final GlobalKey formkey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: 45,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(
              'assets/images/sign_in_sign_up_screens/sign_in_sign_up_text_field_background.png'),
        ),
        borderRadius: BorderRadius.circular(23),
        /*gradient: const LinearGradient(
          colors: <Color>[
            Color(InstaDaleelColors.signInSignUpTextFieldTopGradientColor),
            Color(0xFF51A7E5),
            Color(InstaDaleelColors.signInSignUpTextFieldBottomGradientColor),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: <double>[0.5,0.65,1.0]
        ),*/
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                validator: validator,
                textInputAction: TextInputAction.next,
                keyboardType: textInputType,
                onTap: () {
                  isKeyboardOpen = true;
                },
                obscureText: isObscureText,
                controller: textEditingController,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 4),
                    hintText: hintText,
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    border: InputBorder.none),
                cursorColor: Colors.white,
              ),
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
            child: SizedBox(
              width: 72,
              child: Text(
                labelText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
