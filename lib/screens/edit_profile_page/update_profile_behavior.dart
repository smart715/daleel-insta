import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin UpdateProfileBehavior {
  TextEditingController firstNameFieldTextEditingController =
      TextEditingController();
  TextEditingController lastNameFieldTextEditingController =
      TextEditingController();
  TextEditingController nickNameFieldTextEditingController =
      TextEditingController();
  TextEditingController aboutFieldTextEditingController =
      TextEditingController();
  TextEditingController contactNumberFieldTextEditingController =
      TextEditingController();
  TextEditingController liveInFieldTextEditingController =
      TextEditingController();
  TextEditingController emailAddressFieldTextEditingController =
      TextEditingController();
  TextEditingController occupationFieldTextEditingController =
      TextEditingController();
  ScrollController singleChildScrollController = ScrollController();
  final ImagePicker imagePicker = ImagePicker();
  bool isUpdatingProfile = false;
  XFile? profilePic;
  int radioButtonGroupValue = 0;
  String gender = 'Male';
  GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();
  late Widget saveDataButtonContent;
}
