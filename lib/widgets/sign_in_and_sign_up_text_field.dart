import 'package:country_picker/country_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:insta_daleel/domain/entities/user_profile.dart';

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
