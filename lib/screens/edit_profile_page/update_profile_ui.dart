import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_daleel/data/dtos/user_profile_dto.dart';
import 'package:insta_daleel/domain/entities/user_profile.dart';
import 'package:insta_daleel/domain/repositories/repository.dart';
import 'package:insta_daleel/network_connectivity_handler.dart';
import 'package:insta_daleel/screens/edit_profile_page/update_profile_behavior.dart';
import 'package:insta_daleel/service_locator.dart';
import 'package:insta_daleel/widgets/simple_progress_indicator.dart';
import 'package:country_picker/src/res/country_codes.dart';
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
  ValueNotifier<double> progressNotifier = ValueNotifier(0);
  Country? country, countryContact;
  DateTime? birthDate;
  Gender? selectedGender;
  MaritalStatus? selectedMaritalStatus;
  Occupation? selectedOccupatioon;
  late UserProfile profile;

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
        response = await dio.post(
            'https://insta-daleel.emicon.tech/api/update-profile',
            queryParameters: {
              'token': bearerToken,
            },
            options: Options(contentType: 'multipart/form-data'),
            data: FormData.fromMap(
              {
                'customer_id': profile.id,
                'firstname': firstNameFieldTextEditingController.text,
                'lastname': lastNameFieldTextEditingController.text,
                'nickname': nickNameFieldTextEditingController.text,
                'nationality': country?.name ?? '',
                'about': aboutFieldTextEditingController.text,
                'email': emailAddressFieldTextEditingController.text,
                'address': liveInFieldTextEditingController.text,
                'phone':
                    '+${countryContact?.phoneCode ?? ''}${contactNumberFieldTextEditingController.text}',
                'gender': selectedGender?.name,
                'birthday':
                    '${birthDate!.year}-${birthDate!.month}-${birthDate!.day}',
                'occupation': selectedOccupatioon
                    ?.name, //occupationFieldTextEditingController.text,
                'marital_status': selectedMaritalStatus?.name,
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
            //TODO:TEMPORAL CHANGE THIS
            profile = UserProfileDto.fromJson(updateProfileResponseMap['data'])
                .toDomain();

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
    initProfile();
    super.initState();
  }

  initProfile() {
    profile = serviceLocator<Repository>().getUserProfile();
    firstNameFieldTextEditingController.text = profile.firstName ?? '';
    lastNameFieldTextEditingController.text = profile.lastName ?? '';
    nickNameFieldTextEditingController.text = profile.nickName ?? '';
    emailAddressFieldTextEditingController.text = profile.email ?? '';
    liveInFieldTextEditingController.text = profile.liveIn ?? '';
    userProfilePicLink = profile.profileImage;
    birthDate = profile.birthday;
    selectedGender = profile.gender;
    selectedMaritalStatus = profile.maritalStatus;
    selectedOccupatioon = profile.occupation;
    final countryCodeReg = RegExp(
        r'(?:\+|00)(1|7|2[07]|3[0123469]|4[013456789]|5[12345678]|6[0123456]|8[1246]|9[0123458]|(?:2[12345689]|3[578]|42|5[09]|6[789]|8[035789]|9[679])\d)');
    final match = countryCodeReg.firstMatch(profile.phone!);
    final code = (match![0])!.replaceAll("+", '');
    contactNumberFieldTextEditingController.text =
        profile.phone!.replaceFirst(countryCodeReg, '');
    countryContact = _getFromCode(code);
    country = profile.nationality != null
        ? CountryParser.tryParse(profile.nationality!)
        : null;
  }

  static Country _getFromCode(String phoneCode) {
    return Country.from(
      json: countryCodes.singleWhere(
        (Map<String, dynamic> c) => c['e164_cc'] == phoneCode,
      ),
    );
  }

  computeProgress() {
    //CHECK IMAGE POINT
    progressNotifier.value = 0;
    if (profilePic != null && (userProfilePicLink ?? '').isEmpty) {
      progressNotifier.value = progressNotifier.value + 10;
    } else {
      if ((userProfilePicLink ?? '').isNotEmpty) {
        progressNotifier.value = progressNotifier.value + 10;
      }
    }
    //NAME
    if (firstNameFieldTextEditingController.text.isNotEmpty) {
      progressNotifier.value = progressNotifier.value + 5;
    }
    if (lastNameFieldTextEditingController.text.isNotEmpty) {
      progressNotifier.value = progressNotifier.value + 2.5;
    }
    //Nick NAME
    if (nickNameFieldTextEditingController.text.isNotEmpty) {
      progressNotifier.value = progressNotifier.value + 2.5;
    }
    //Country
    if (country != null) {
      progressNotifier.value = progressNotifier.value + 10;
    }
    //CONTACT
    if (country != null &&
        contactNumberFieldTextEditingController.text.isNotEmpty) {
      progressNotifier.value = progressNotifier.value + 10;
    }
    //Live IN
    if (liveInFieldTextEditingController.text.isNotEmpty) {
      progressNotifier.value = progressNotifier.value + 10;
    }
    //EMAIL
    if (emailAddressFieldTextEditingController.text.isNotEmpty) {
      progressNotifier.value = progressNotifier.value + 10;
    }
    //Birth Date
    if (birthDate != null) {
      progressNotifier.value = progressNotifier.value + 10;
    }

    if (selectedGender != null) {
      progressNotifier.value = progressNotifier.value + 10;
    }

    if (selectedMaritalStatus != null) {
      progressNotifier.value = progressNotifier.value + 10;
    }

    if (selectedOccupatioon != null) {
      progressNotifier.value = progressNotifier.value + 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    computeProgress();
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
                        ValueListenableBuilder(
                          valueListenable: progressNotifier,
                          builder: (context, value, __) {
                            return value > 0
                                ? SimpleCircularProgressBar(
                                    valueNotifier: progressNotifier,
                                    // backColor: Colors.red,
                                    progressStrokeWidth: 10,
                                    backStrokeWidth: 10,
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
                                          image: (profilePic == null)
                                              ? CachedNetworkImageProvider(
                                                  userProfilePicLink != null
                                                      ? userProfilePicLink!
                                                      : 'https://www.freeiconspng.com/uploads/profile-icon-1.png')
                                              : FileImage(
                                                      File(profilePic!.path))
                                                  as ImageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : Material(
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
                                          image: (profilePic == null)
                                              ? CachedNetworkImageProvider(
                                                  userProfilePicLink != null
                                                      ? userProfilePicLink!
                                                      : 'https://www.freeiconspng.com/uploads/profile-icon-1.png')
                                              : FileImage(
                                                      File(profilePic!.path))
                                                  as ImageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                          },
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
                          hintText: 'First Name',
                          labelText: 'First Name',
                          textEditingController:
                              firstNameFieldTextEditingController,
                          onChange: (value) {
                            computeProgress();
                          },
                          alignRight: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'First Name can\'t be empty.';
                            }
                            return null;
                          },
                        ),
                        SignInAndSignUpTextField(
                          hintText: 'Last Name',
                          labelText: 'Last Name',
                          textEditingController:
                              lastNameFieldTextEditingController,
                          onChange: (value) {
                            computeProgress();
                          },
                          alignRight: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Last Name can\'t be empty.';
                            }
                            return null;
                          },
                        ),
                        SignInAndSignUpTextField(
                          hintText: 'Nick Name here',
                          labelText: 'Nick Name',
                          textEditingController:
                              nickNameFieldTextEditingController,
                          onChange: (value) {
                            computeProgress();
                          },
                          alignRight: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Nick Name can\'t be empty.';
                            }
                            return null;
                          },
                        ),

                        CountryPickerDisplay(
                          hintText: 'Nationality here',
                          labelText: 'Nationality',
                          country: country,
                          onChange: (value) {
                            setState(() {
                              country = value;
                              // countryContact = value;
                            });
                          },
                        ),
                        ContactInputDisplay(
                          hintText: 'Type Number',
                          labelText: 'Contact\nNumber',
                          textInputType: TextInputType.number,
                          textEditingController:
                              contactNumberFieldTextEditingController,
                          country: countryContact,
                          onChange: (c, value) {
                            setState(() {
                              // country = c;
                              countryContact = c;
                            });
                          },
                        ),

                        SignInAndSignUpTextField(
                          hintText: 'Type here',
                          labelText: 'Live in',
                          textEditingController:
                              liveInFieldTextEditingController,
                          onChange: (value) {
                            computeProgress();
                          },
                          alignRight: true,
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
                          onChange: (value) {
                            computeProgress();
                          },
                          alignRight: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email can\'t be empty.';
                            }
                            return null;
                          },
                        ),

                        DatePickerDisplay(
                          hintText: '',
                          labelText: 'Birth Date',
                          date: birthDate,
                          onChange: (value) {
                            setState(() {
                              birthDate = value;
                            });
                          },
                        ),
                        // SignInAndSignUpTextField(
                        //   hintText: 'Type here',
                        //   labelText: 'Occupation',
                        //   textEditingController:
                        //       occupationFieldTextEditingController,
                        //   onChange: (value) {
                        //     computeProgress();
                        //   },
                        // ),
                        DropDownMenuItemInput<Gender>(
                          labelText: 'Gender',
                          itemsList: Gender.values,
                          dropDownVal: selectedGender,
                          onChange: (val) {
                            setState(() {
                              selectedGender = val!;
                            });
                          },
                        ),

                        DropDownMenuItemInput<MaritalStatus>(
                          labelText: 'Marital\nStatus',
                          itemsList: MaritalStatus.values,
                          dropDownVal: selectedMaritalStatus,
                          onChange: (val) {
                            setState(() {
                              selectedMaritalStatus = val!;
                            });
                          },
                        ),

                        DropDownMenuItemInput<Occupation>(
                          labelText: 'Occupation',
                          itemsList: Occupation.values,
                          dropDownVal: selectedOccupatioon,
                          onChange: (val) {
                            setState(() {
                              selectedOccupatioon = val!;
                            });
                          },
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
