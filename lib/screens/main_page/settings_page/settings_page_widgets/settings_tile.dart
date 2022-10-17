import 'package:flutter/material.dart';
import 'package:insta_daleel/global_members.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {super.key,
      required this.title,
      required this.onTap,
      this.icons,
      this.imageIcon});

  final String title;
  final IconData? icons;
  final String? imageIcon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    bool showImage = (imageIcon != null);
    if (!showImage) if (icons == null) throw ('Icon and Image can not be null');
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              recBkg,
            ),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // const Icon(
            //   Icons.arrow_back_ios_new_outlined,
            //   size: 16,
            //   color: Colors.white,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.end,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: showImage
                      ? Center(
                          child: Image.asset(
                            imageIcon!,
                            // width: 16,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Icon(
                          icons!,
                          size: 16,
                          color: Colors.white,
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
