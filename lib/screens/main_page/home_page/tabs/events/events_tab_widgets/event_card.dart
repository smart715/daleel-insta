import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';

class EventCard extends StatelessWidget {
  const EventCard(
      {Key? key,
      required this.title,
      required this.dateAndTime,
      required this.backgroundImageLink,
      required this.iconPath,
      required this.onTap})
      : super(key: key);

  final String title, dateAndTime, backgroundImageLink, iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 180,
          child: Stack(
            children: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                imageUrl: backgroundImageLink,
                colorBlendMode: BlendMode.multiply,
                color: const Color.fromRGBO(0, 0, 0, 0.39),
                placeholder: (BuildContext context, String url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                    child: Icon(
                  Icons.error_outline_outlined,
                  color: Colors.white,
                )),
              ),
              Positioned(
                right: 30,
                top: 10,
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dateAndTime,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: const Color(InstaDaleelColors.primaryColor),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Image(
                            height: 20,
                            width: 20,
                            fit: BoxFit.contain,
                            image: AssetImage(
                              iconPath,
                            ),
                          ),
                        ),
                      ),
                    ],
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
