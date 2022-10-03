import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/edit_profile_page/update_profile_behavior.dart';
import '../../../constants/colors.dart';
import '../../global_members.dart';
import '../../widgets/sign_in_and_sign_up_text_field.dart';
import '../profile_page/profile_page_behavior.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  static const String editProfileRoute = 'EditProfile';

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile>
    with UpdateProfileBehavior, ConnectivityHandler {
  void savingDataIndicator() {
    if (isUpdatingProfile) {
      setState(() {
        saveDataButtonContent = const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        );
      });
    } else {
      setState(() {
        saveDataButtonContent = const Text(
          'Save Data',
          style: TextStyle(
            color: Colors.white,
          ),
        );
      });
    }
  }

  void updateProfile() async {
    late Response response;
    isUpdatingProfile = true;
    savingDataIndicator();
    if (await checkForInternetServiceAvailability(context)) {
      try {
        response = await dio.post('$baseUrl/api/update-profile',
            queryParameters: {
              'token': bearerToken,
            },
            options: Options(contentType: 'multipart/form-data'),
            data: FormData.fromMap(
              {
                'customer_id': userId,
                'name': nameFieldTextEditingController.text,
                'about': aboutFieldTextEditingController.text,
                'email': emailAddressFieldTextEditingController.text,
                'address': liveInFieldTextEditingController.text,
                'gender': gender,
                'occupation': occupationFieldTextEditingController.text,
                'latitude': '0.0',
                'longitude': '0.0',
                'image': profilePic != null
                    ? MultipartFile(File(profilePic!.path).openRead(),
                        await profilePic!.length(),
                        filename: profilePic!.name)
                    : null,
              },
            ));

        Map<String, dynamic> updateProfileResponseMap =
            response.data is Map<String, dynamic> ? response.data : {};

        if (updateProfileResponseMap.isNotEmpty) {
          String updateProfileResponseStatus =
              updateProfileResponseMap['status'] is String
                  ? updateProfileResponseMap['status']
                  : '';

          if (updateProfileResponseStatus == 'success') {
            userName = updateProfileResponseMap['data'] is Map<String, dynamic>
                ? updateProfileResponseMap['data']['name'] is String
                    ? updateProfileResponseMap['data']['name']
                    : '---'
                : '---';

            userProfilePicLink =
                updateProfileResponseMap['data'] is Map<String, dynamic>
                    ? updateProfileResponseMap['data']['image'] is String
                        ? updateProfileResponseMap['data']['image']
                        : null
                    : null;

            isUpdatingProfile = false;
            profilePic = null;
            savingDataIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'profile updated successfully',
              ),
            ));
          } else if (updateProfileResponseStatus == 'error') {
            String errorMessage =
                updateProfileResponseMap['data'] is Map<String, dynamic>
                    ? updateProfileResponseMap['data']['email'] is List<dynamic>
                        ? updateProfileResponseMap['data']['email'][0] is String
                            ? updateProfileResponseMap['data']['email'][0]
                            : 'unable to update, please try again later'
                        : 'unable to update, please try again later'
                    : 'unable to update, please try again later';

            isUpdatingProfile = false;
            savingDataIndicator();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                errorMessage,
              ),
            ));
          } else {
            isUpdatingProfile = false;
            savingDataIndicator();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'something went wrong, please try again1',
              ),
            ));
          }
        } else {
          isUpdatingProfile = false;
          savingDataIndicator();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'server not responding, please try again',
            ),
          ));
        }
      } on Exception {
        isUpdatingProfile = false;
        savingDataIndicator();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'something went wrong, please try again2',
          ),
        ));
      }
    } else {
      isUpdatingProfile = false;
      savingDataIndicator();
    }
  }

  @override
  void didChangeDependencies() {
    if (MediaQuery.of(context).viewInsets.bottom > 0) {
      isKeyboardOpen = true;
    } else {
      if (isKeyboardOpen) {
        isKeyboardOpen = false;
        singleChildScrollController.jumpTo(0.0);
      }
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    isKeyboardOpen = false;
    savingDataIndicator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          isKeyboardOpen = false;
          singleChildScrollController.jumpTo(0.0);
        },
        child: Column(
          children: [
            //app bar
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    ProfilePageBehavior.setStateProfilePage();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(InstaDaleelColors.primaryColor),
                  ),
                ),
                title: const Center(
                  child: Text(
                    'Edit Profile',
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
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  controller: singleChildScrollController,
                  physics: (isKeyboardOpen ||
                          MediaQuery.of(context).size.height < 900)
                      ? const AlwaysScrollableScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Form(
                    key: updateProfileFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(40),
                          elevation: 5.0,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    userProfilePicLink != null
                                        ? userProfilePicLink!
                                        : 'https://www.freeiconspng.com/uploads/profile-icon-1.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        // change photo button
                        GestureDetector(
                          onTap: () async {
                            profilePic = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {});
                          },
                          child: SizedBox(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Container(
                                height: 38,
                                width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(
                                        InstaDaleelColors.primaryColor)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        profilePic == null
                                            ? 'Change Photo'
                                            : profilePic!.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SignInAndSignUpTextField(
                          hintText: 'Name here',
                          labelText: 'Name',
                          textEditingController: nameFieldTextEditingController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Name can\'t be empty.';
                            }
                            return null;
                          },
                        ),

                        SignInAndSignUpTextField(
                          hintText: 'Type here',
                          labelText: 'About me',
                          textEditingController:
                              aboutFieldTextEditingController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'About can\'t be empty.';
                            }
                            return null;
                          },
                        ),

                        SignInAndSignUpTextField(
                          hintText: 'Type here',
                          labelText: 'Contact\nNumber',
                          textEditingController:
                              contactNumberFieldTextEditingController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Contact can\'t be empty.';
                            }
                            return null;
                          },
                        ),

                        SignInAndSignUpTextField(
                          hintText: 'Type here',
                          labelText: 'Live in',
                          textEditingController:
                              liveInFieldTextEditingController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Address can\'t be empty.';
                            }
                            return null;
                          },
                        ),

                        SignInAndSignUpTextField(
                          hintText: 'Type here',
                          labelText: 'Email\nAddress',
                          textEditingController:
                              emailAddressFieldTextEditingController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email can\'t be empty.';
                            }
                            return null;
                          },
                        ),

                        SignInAndSignUpTextField(
                          hintText: 'Type here',
                          labelText: 'Occupation',
                          textEditingController:
                              occupationFieldTextEditingController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Occupation can\'t be empty.';
                            }
                            return null;
                          },
                        ),

                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    groupValue: radioButtonGroupValue,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    activeColor: const Color(
                                        InstaDaleelColors.primaryColor),
                                    onChanged: (int? value) {
                                      setState(() {
                                        radioButtonGroupValue = value!;
                                        gender = 'Male';
                                      });
                                    },
                                    title: const Text(
                                      'Male',
                                      style: TextStyle(
                                        color: Color(
                                            InstaDaleelColors.primaryColor),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    value: 0,
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    activeColor: const Color(
                                        InstaDaleelColors.primaryColor),
                                    groupValue: radioButtonGroupValue,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    onChanged: (int? value) {
                                      setState(() {
                                        radioButtonGroupValue = value!;
                                        gender = 'Female';
                                      });
                                    },
                                    title: const Text(
                                      'Female',
                                      style: TextStyle(
                                        color: Color(
                                            InstaDaleelColors.primaryColor),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    value: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            isKeyboardOpen = false;
                            if (updateProfileFormKey.currentState!.validate()) {
                              if (!isUpdatingProfile) {
                                updateProfile();
                              }
                            }
                          },
                          child: SizedBox(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width - 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color(
                                        InstaDaleelColors.primaryColor)),
                                child: Center(
                                  child: saveDataButtonContent,
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
            ),
          ],
        ),
      ),
    );
  }
}
