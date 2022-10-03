import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/sign_in/sign_in_ui.dart';
import 'package:insta_daleel/screens/sign_up/sign_up_behavior.dart';
import '../../global_members.dart';
import '../../widgets/sign_in_and_sign_up_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SignUpBehavior, ConnectivityHandler {

  void signingUpIndicator() {
    if(isSigningUp) {
      setState(() {
        signUpButtonContent = const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        );
      });
    }
    else {
      setState(() {
        signUpButtonContent = const Text(
          'Send',
          style: TextStyle(
            color: Colors.white,
          ),
        );
      });
    }
  }

  void signUp() async {
    isSigningUp = true;
    signingUpIndicator();
    if(await checkForInternetServiceAvailability(context)) {
      try {
           response = await dio.post('https://insta-daleel.emicon.tech/api/auth/register', queryParameters: {
          'name': signUpFullNameFieldTextEditingController.text,
          'email': signUpEmailAddressFieldTextEditingController.text,
          'phone': signUpMobileNumberFieldTextEditingController.text,
          'password': signUpPasswordFieldTextEditingController.text,
          'password_confirmation': signUpConfirmPasswordFieldTextEditingController.text,
        });
      } on Exception {
        isSigningUp = false;
        signingUpIndicator();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong, please try again',),));
      }

      signUpResponseMap = response.data is Map<String, dynamic> ?
      response.data
      :
          {};

      if(signUpResponseMap.isNotEmpty) {
        signUpResponseStatus = signUpResponseMap['status'] is String ? signUpResponseMap['status'] : '';

        if(signUpResponseStatus == 'success') {
          isSigningUp = false;
          signingUpIndicator();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('signed up successfully',),));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn(),));
        }
        else if(signUpResponseStatus == 'error') {
          isSigningUp = false;
          signingUpIndicator();

          try {
            phoneNumberStatus = signUpResponseMap['data'] is Map<String, dynamic> ?
            signUpResponseMap['data']['phone'] is List<dynamic> ? signUpResponseMap['data']['phone'][0] : '' : '';

            emailStatus = signUpResponseMap['data'] is Map<String, dynamic> ?
            signUpResponseMap['data']['email'] is List<dynamic> ? signUpResponseMap['data']['email'][0] : '' : '';

            showErrorDialog(errorMessage: '$phoneNumberStatus \n $emailStatus');

          } on Exception {
            isSigningUp = false;
            signingUpIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong, please try again',),));
          }
        }
        else {
          isSigningUp = false;
          signingUpIndicator();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong, please try again',),));
        }
      }
      else {
        isSigningUp = false;
        signingUpIndicator();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('server not responding, please try again',),));
      }
    }
    else {
      isSigningUp = false;
      signingUpIndicator();
    }
  }

  void showErrorDialog({required String errorMessage}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error',),
          content: Text(
            errorMessage,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Color(InstaDaleelColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
    );
  }

  @override
  void initState() {
    signingUpIndicator();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(MediaQuery.of(context).viewInsets.bottom > 0) {
      isKeyboardOpen = true;
    }
    else {
      if(isKeyboardOpen) {
        isKeyboardOpen = false;
        singleChildScrollController.jumpTo(0.0);
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        isKeyboardOpen = false;
        singleChildScrollController.jumpTo(0.0);
      },
      child: Scaffold(
        backgroundColor: const Color(InstaDaleelColors.backgroundColor),
        body: SingleChildScrollView(
          controller: singleChildScrollController,
          physics: (isKeyboardOpen || MediaQuery.of(context).size.height < 710) ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 170,
                child: const Text(
                  'Insta\nDaleel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PoppinsMedium',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    // fontFamily: 'Poppins',
                    color: Color(InstaDaleelColors.primaryColor),
                  ),
                ),
              ),
              Container(
                height: 70,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae, at orci mattis augue est eu. Ac ullamcorper amet .......Lorem ipsum dolor sit amet, ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PoppinsRegular',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    // fontFamily: 'Poppins',
                    color: Color(InstaDaleelColors.primaryColor),
                  ),
                ),
              ),
              Form(
                key: signUpFormKey,
                child: Column(
                  children: [
                    SignInAndSignUpTextField(
                      labelText: 'Full\nName',
                      hintText: 'Enter full name',
                      textEditingController: signUpFullNameFieldTextEditingController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Name can\'t be empty.';
                        }
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      labelText: 'Email\nAddress',
                      hintText: 'Enter email address',
                      textEditingController: signUpEmailAddressFieldTextEditingController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email can\'t be empty.';
                        }
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      labelText: 'Mobile\nNumber',
                      hintText: 'Enter mobile number',
                      textEditingController: signUpMobileNumberFieldTextEditingController,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Mobile number can\'t be empty.';
                        }
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      labelText: 'Password',
                      hintText: 'Enter password',
                      textEditingController: signUpPasswordFieldTextEditingController,
                      isObscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can\'t be empty.';
                        }
                        else if(value.length < 6) {
                          return 'Password must be at least 6 characters long.';
                        }
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      labelText: 'Confirm\nPassword',
                      hintText: 'Re-Enter password',
                      textEditingController: signUpConfirmPasswordFieldTextEditingController,
                      isObscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can\'t be empty.';
                        }
                        else if(value.length < 6) {
                          return 'Password must be at least 6 characters long.';
                        }
                        else if(value != signUpPasswordFieldTextEditingController.text) {
                          return 'Password do not match.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  if (signUpFormKey.currentState!.validate()) {
                    if(!isSigningUp) {
                      signUp();
                    }
                  }
                },
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(InstaDaleelColors.primaryColor)
                        ),
                        child: Center(
                          child: signUpButtonContent,
                        ),
                      ),
                    ),
                  ),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have an account ?',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        isKeyboardOpen = false;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignIn(),));
                      },
                      child: const Text('Sign in now',
                        style: TextStyle(
                            color: Color(InstaDaleelColors.primaryColor),
                            fontWeight: FontWeight.bold
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
    );
  }
}
