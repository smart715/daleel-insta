import 'dart:io';
import 'dart:math';

import 'package:country_picker/country_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_daleel/domain/entities/user_profile.dart';
import 'package:insta_daleel/screens/support/support_option_tile.dart';

import '../global_members.dart';

class SignInAndSignUpTextField extends StatelessWidget {
  const SignInAndSignUpTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
    this.isObscureText = false,
    this.validator,
    this.textInputType,
    this.onChange,
    this.alignRight = false,
  }) : super(key: key);

  final String labelText, hintText;
  final TextEditingController textEditingController;
  final bool isObscureText;
  final Validator? validator;
  final TextInputType? textInputType;
  final Function(String value)? onChange;
  final bool alignRight;
  // final GlobalKey formkey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: 45,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(buttonBkg),
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                validator: validator,
                onChanged: (value) =>
                    (onChange != null) ? onChange!(value) : () {},
                textInputAction: TextInputAction.next,
                keyboardType: textInputType,
                onTap: () {
                  isKeyboardOpen = true;
                },
                obscureText: isObscureText,
                controller: textEditingController,
                textAlign: !alignRight ? TextAlign.start : TextAlign.right,
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
            child: Text(
              labelText,
              textAlign: TextAlign.end,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

AlertDialog showCustomDialog({
  required BuildContext context,
  required List<String> topics,
  int? currentIndex,
  required Function(int index) onSelect,
}) {
  double height = (max(1, topics.length) * 50) + 230;
  int selectedIndex = currentIndex ?? -1;
  List<Widget> buildTiles() {
    List<Widget> newList = List.generate(topics.length * 2, (index) {
      if (index.isOdd) {
        return const Divider(
          color: Color(0xffE0E0E0),
          thickness: 0.5,
          endIndent: 5,
          indent: 5,
        );
      }
      int i = index ~/ 2;
      return SupportOptionTile(
        title: topics[i],
        isActive: currentIndex != null && currentIndex == i,
        index: i,
        select: (v) {
          selectedIndex = v;
          onSelect(v);
        },
      );
    });
    return newList;
  }

  return AlertDialog(
    backgroundColor: Colors.transparent,
    insetPadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    content: Container(
      height: height,
      width: MediaQuery.of(context).size.width - 30,
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 45,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/comapny_inner_page/sh.png'),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 26,
                ),
                const Expanded(
                    child: Center(
                        child: Text(
                  'Choose Topic',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 26,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ...buildTiles(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context, selectedIndex);
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(submitBtnBkg),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Select',
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
          // const SizedBox(
          //   height: 10,
          // ),
        ],
      ),
      // Positioned(
      //   right: 10,
      //   top: 10,
      //   child: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Icon(
      //       Icons.close,
      //       size: 26,
      //       color: Color(InstaDaleelColors.primaryColor),
      //     ),
      //   ),
      // ),
    ),
  );
}

class CustomSupportDialog extends StatefulWidget {
  const CustomSupportDialog({
    Key? key,
    required this.hintText,
    required this.options,
    required this.onChange,
    required this.currentIndex,
  }) : super(key: key);

  final String hintText;
  final Function(int value) onChange;
  final List<String> options;
  final int currentIndex;

  @override
  State<CustomSupportDialog> createState() => _CustomSupportDialogState();
}

class _CustomSupportDialogState extends State<CustomSupportDialog> {
  late int pi;
  @override
  void initState() {
    super.initState();

    pi = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (ctx) {
            return StatefulBuilder(
              builder: (ctx, s) {
                int p = pi;
                return showCustomDialog(
                  context: ctx,
                  topics: widget.options,
                  currentIndex: p,
                  onSelect: (index) {
                    p = index;
                    pi = p;
                    widget.onChange(index);
                    s(() {});
                    setState(() {});
                  },
                );
              },
            );
          },
        );
        // setState(() {
        //   // c = ci;
        // });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
        height: 60,
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(buttonBkg),
          ),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  widget.hintText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
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

class TextAreaTextField extends StatelessWidget {
  const TextAreaTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
    this.isObscureText = false,
    this.validator,
    this.textInputType,
    this.maxLines = 5,
    this.onChange,
    this.alignRight = false,
    this.height = 100,
  }) : super(key: key);

  final String labelText, hintText;
  final TextEditingController textEditingController;
  final bool isObscureText;
  final int maxLines;
  final Validator? validator;
  final TextInputType? textInputType;
  final Function(String value)? onChange;
  final bool alignRight;
  final double height;
  // final GlobalKey formkey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: height,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(buttonBkg),
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                validator: validator,
                minLines: 4,
                maxLines: null,
                onChanged: (value) =>
                    (onChange != null) ? onChange!(value) : () {},
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                onTap: () {
                  isKeyboardOpen = true;
                },
                obscureText: isObscureText,
                controller: textEditingController,
                textAlign: !alignRight ? TextAlign.start : TextAlign.right,
                style: const TextStyle(fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  hintText: hintText,
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: double.infinity,
            width: 5,
            child: VerticalDivider(
              color: Colors.white,
              thickness: 1,
              width: 1,
              indent: 10,
              endIndent: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  labelText,
                  textAlign: TextAlign.end,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePickerTextField extends StatelessWidget {
  const ImagePickerTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.onChange,
    required this.pickedImage,
  }) : super(key: key);

  final String labelText, hintText;
  final File? pickedImage;
  final Function(XFile? value) onChange;
  // final GlobalKey formkey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: 45,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(buttonBkg),
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: GestureDetector(
        onTap: () async {
          onChange(await ImagePicker().pickImage(source: ImageSource.gallery));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10, left: 20),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 27,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (pickedImage != null)
                      Image.file(
                        pickedImage!,
                        height: 35,
                      ),
                    if (pickedImage == null)
                      const Text(
                        'Select an image',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ],
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 10),
                  child: Text(
                    labelText,
                    textAlign: TextAlign.end,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CountryPickerDisplay extends StatelessWidget {
  const CountryPickerDisplay({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.country,
    this.isObscureText = false,
    this.validator,
    this.textInputType,
    required this.onChange,
  }) : super(key: key);
  final String labelText, hintText;
  final Country? country;
  final bool isObscureText;
  final Validator? validator;
  final TextInputType? textInputType;
  final Function(Country value) onChange;
  // final GlobalKey formkey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCountryPicker(
          context: context,
          favorite: <String>['AE'],
          showPhoneCode: true,
          onSelect: (Country country) {
            onChange(country);
          },

          // Optional. Sets the theme for the country list picker.
          countryListTheme: CountryListThemeData(
            // Optional. Sets the border radius for the bottomsheet.
            bottomSheetHeight: MediaQuery.of(context).size.height * 0.75,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            // Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
        height: 45,
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(buttonBkg),
          ),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 45,
              height: 45,
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (country != null)
                      Text(
                        country?.flagEmoji ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    if (country != null)
                      Text(
                        country?.name ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    if (country == null)
                      const Text(
                        'Select Nationality',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                  ],
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
              child: Text(
                labelText,
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInputDisplay extends StatelessWidget {
  const ContactInputDisplay({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
    this.country,
    this.isObscureText = false,
    this.validator,
    this.textInputType,
    this.showDefault = false,
    required this.onChange,
  }) : super(key: key);
  final String labelText, hintText;
  final Country? country;
  final bool isObscureText;
  final Validator? validator;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;
  final bool showDefault;
  final Function(Country? country, String number) onChange;
  // final GlobalKey formkey;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> defaultCountry = {
      'iso2_cc': "AE",
      'display_name': "United Arab Emirates (AE) [+971]",
      'displayNameNoCountryCode': "United Arab Emirates (AE)",
      'e164_key': "971-AE-0",
      'e164_sc': 0,
      'example': "501234567",
      'full_example_with_plus_sign': "+971501234567",
      'geographic': true,
      'level': 1,
      'name': "United Arab Emirates",
      'nameLocalized': null,
      'e164_cc': "971",
      'display_name_no_e164_cc': "United Arab Emirates (AE)",
    };
    Country? c = country;
    if (showDefault && c == null) {
      c = Country.from(json: defaultCountry);
    }
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: 45,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(buttonBkg),
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              showCountryPicker(
                context: context,
                favorite: <String>['AE'],
                showPhoneCode: true,
                onSelect: (Country ct) {
                  onChange(ct, textEditingController.text);
                },

                // Optional. Sets the theme for the country list picker.
                countryListTheme: CountryListThemeData(
                  // Optional. Sets the border radius for the bottomsheet.
                  bottomSheetHeight: MediaQuery.of(context).size.height * 0.75,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  // Optional. Styles the search field.
                  inputDecoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Start typing to search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFF8C98A8).withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Container(
              width: 110,
              height: 45,
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (c != null)
                      Text(
                        c.flagEmoji,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    if (c != null)
                      const SizedBox(
                        width: 10,
                      ),
                    if (c != null)
                      Text(
                        '+ ${c.phoneCode}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    if (c == null)
                      const Text(
                        '+ 000',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Colors.white,
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 0.5,
                      indent: 8,
                      endIndent: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                validator: validator,
                onChanged: (value) =>
                    onChange(c, textEditingController.text) ?? () {},
                textInputAction: TextInputAction.next,
                keyboardType: textInputType,
                onTap: () {
                  isKeyboardOpen = true;
                },
                obscureText: isObscureText,
                controller: textEditingController,
                textAlign: TextAlign.right,
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
            child: Text(
              labelText,
              textAlign: TextAlign.end,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class DatePickerDisplay extends StatelessWidget {
  const DatePickerDisplay({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.date,
    this.isObscureText = false,
    this.validator,
    this.textInputType,
    required this.onChange,
  }) : super(key: key);
  final String labelText, hintText;
  final DateTime? date;
  final bool isObscureText;
  final Validator? validator;
  final TextInputType? textInputType;
  final Function(DateTime? value) onChange;
  // final GlobalKey formkey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? d = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        onChange(d);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
        height: 45,
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(buttonBkg),
          ),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (date != null)
                      Text(
                        '${date!.day} / ${date!.month} / ${date!.year}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    if (date == null)
                      const Text(
                        'DD / MM / YY',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                  ],
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
              child: Text(
                labelText,
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownMenuItemInput<T> extends StatelessWidget {
  const DropDownMenuItemInput({
    Key? key,
    required this.labelText,
    required this.itemsList,
    required this.dropDownVal,
    this.hintText = '',
    // required this.notifier,
    required this.onChange,
  }) : super(key: key);

  final String labelText, hintText;
  final List<T> itemsList;
  final T? dropDownVal;
  final Function(T? value) onChange;
  // final ValueNotifier<T> notifier;

  List<DropdownMenuItem<T?>> buildDropdownItems<T>(List<T> itemList) {
    List<DropdownMenuItem<T?>> items = [];
    for (var item in itemList) {
      if (item is Gender) {
        items.add(
          DropdownMenuItem(
            value: item,
            child: Text(
              (item.name),
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        );
      }
      if (item is MaritalStatus) {
        items.add(
          DropdownMenuItem(
            value: item,
            child: Text(
              (item.name),
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        );
      }
      if (item is Occupation) {
        items.add(
          DropdownMenuItem(
            value: item,
            child: Text(
              item.name,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        );
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final dropDownItems = buildDropdownItems(itemsList);
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      height: 45,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(buttonBkg),
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 45,
            height: 45,
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                items: dropDownItems,
                isExpanded: true,
                itemHeight: 45,
                buttonHeight: 45,
                value: dropDownVal,
                iconSize: 0,
                onChanged: (val) {
                  // notifier.value = val as T;
                  onChange(val);
                },
                selectedItemBuilder: (context) => [
                  (dropDownVal == null)
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  (dropDownVal as Enum).name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ],
                        ),
                  (dropDownVal == null)
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  (dropDownVal as Enum).name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ],
                        ),
                  (dropDownVal == null)
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  (dropDownVal as Enum).name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ],
                        ),
                ],
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 1),
            child: VerticalDivider(
              color: Colors.white,
              thickness: 0.5,
              indent: 8,
              endIndent: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 10),
            child: Text(
              labelText,
              textAlign: TextAlign.end,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
