import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin SignInBehavior {
  TextEditingController signInMobileNumberFieldTextEditingController = TextEditingController();
  TextEditingController signInPasswordFieldTextEditingController = TextEditingController();
  ScrollController singleChildScrollController = ScrollController();
  late Map<String, dynamic> signInResponseMap;
  late Response<dynamic> response;
  String signInResponseStatus = '', errorMessage = '';
  bool isSigningIn = false;
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  late Widget signInButtonContent;
}