import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin SignUpBehavior {
  TextEditingController signUpFullNameFieldTextEditingController = TextEditingController();
  TextEditingController signUpEmailAddressFieldTextEditingController = TextEditingController();
  TextEditingController signUpMobileNumberFieldTextEditingController = TextEditingController();
  TextEditingController signUpPasswordFieldTextEditingController = TextEditingController();
  TextEditingController signUpConfirmPasswordFieldTextEditingController = TextEditingController();
  ScrollController singleChildScrollController = ScrollController();
  late Map<String, dynamic> signUpResponseMap;
  late Response<dynamic> response;
  String signUpResponseStatus = '', phoneNumberStatus = '', emailStatus = '';
  bool isSigningUp = false;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  late Widget signUpButtonContent;
}