import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/main_page/main_page_ui.dart';
import 'package:insta_daleel/screens/sign_in/sign_in_behavior.dart';
import 'package:insta_daleel/screens/sign_up/sign_up_ui.dart';
import '../../global_members.dart';
import '../../widgets/sign_in_and_sign_up_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SignInBehavior, ConnectivityHandler {

  void signingInIndicator() {
    if(isSigningIn) {
      setState(() {
        signInButtonContent = const SizedBox(
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
        signInButtonContent = const Text(
          'Send',
          style: TextStyle(
            color: Colors.white,
          ),
        );
      });
    }
  }

  void signIn() async {
    isSigningIn = true;
    signingInIndicator();
    if(await checkForInternetServiceAvailability(context)) {
      try {
        response = await dio.post('https://insta-daleel.emicon.tech/api/auth/login', queryParameters: {
          'phone': signInMobileNumberFieldTextEditingController.text,
          'password': signInPasswordFieldTextEditingController.text,
        },);

        signInResponseMap = response.data is Map<String, dynamic> ?
        response.data
            :
        {};

        if(signInResponseMap.isNotEmpty) {
          signInResponseStatus = signInResponseMap['status'] is String ? signInResponseMap['status'] : '';

          if(signInResponseStatus == 'success') {
            bearerToken = signInResponseMap['access_token'] is String ? signInResponseMap['access_token'] : '';
            userId = signInResponseMap['data'] is Map<String, dynamic> ?
            signInResponseMap['data']['id'] is int ?
            signInResponseMap['data']['id'] : -1 : -1;

            userName = signInResponseMap['data'] is Map<String, dynamic> ?
            signInResponseMap['data']['name'] is String ?
            signInResponseMap['data']['name'] : '---' : '---';

            userProfilePicLink = signInResponseMap['data'] is Map<String, dynamic> ?
            signInResponseMap['data']['image'] is String ?
            'https://insta-daleel.emicon.tech/images/customer/${signInResponseMap['data']['image']}' : null : null;

            isSigningIn = false;
            signingInIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('signed in successfully',),));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(),));
          }
          else if(signInResponseStatus == 'error') {
            isSigningIn = false;
            signingInIndicator();

            errorMessage = 'Phone number or password is invalid.';
            showErrorDialog(errorMessage: errorMessage);
          }
          else {
            isSigningIn = false;
            signingInIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong, please try again',),));
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('........$signInResponseStatus',),));
          }
        }
        else {
          isSigningIn = false;
          signingInIndicator();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong, please try again',),));
        }

      } on Exception {
        isSigningIn = false;
        signingInIndicator();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong, please try again',),));
        // showErrorDialog(errorMessage: '$response');
      }

    }
    else {
      isSigningIn = false;
      signingInIndicator();
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
    signingInIndicator();
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
          physics: (isKeyboardOpen || MediaQuery.of(context).size.height < 650) ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
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
                    'Sign In',
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
                key: signInFormKey,
                child: Column(
                  children: [
                    SignInAndSignUpTextField(
                      labelText: 'Mobile\nNumber',
                      hintText: 'Enter mobile number',
                      textEditingController: signInMobileNumberFieldTextEditingController,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mobile number can\'t be empty.';
                        }
                        return null;
                      },
                    ),
                    SignInAndSignUpTextField(
                      labelText: 'Password',
                      hintText: 'Enter password',
                      textEditingController: signInPasswordFieldTextEditingController,
                      isObscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can\'t be empty.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (signInFormKey.currentState!.validate()) {
                    if(!isSigningIn) {
                      signIn();
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
                        child: signInButtonContent,
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
                      'Don’t have an account ?',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        isKeyboardOpen = false;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ));
                      },
                      child: const Text('Sign up now',
                        style: TextStyle(
                            color: Color(InstaDaleelColors.primaryColor),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot password ?',
                    style: TextStyle(
                        color: Color(InstaDaleelColors.primaryColor),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
