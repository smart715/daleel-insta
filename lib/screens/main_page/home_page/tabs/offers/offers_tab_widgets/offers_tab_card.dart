import 'package:flutter/material.dart';
import 'package:insta_daleel/global_members.dart';

class OffersTabCard extends StatelessWidget {
  final bool isActive, isFeatured;
  const OffersTabCard({
    Key? key,
    required this.offersTabCardModel,
    this.isActive = true,
    this.isFeatured = false,
  }) : super(key: key);

  final OffersTabCardModel offersTabCardModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: offersTabCardModel.onTap,
        child: Container(
          height: 110,
          padding:
              const EdgeInsets.only(left: 10, right: 8, top: 10, bottom: 10),
          decoration: (isActive)
              ? BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 9,
                      offset: Offset(4, 4),
                      color: Color.fromRGBO(0, 0, 0, 0.03),
                    )
                  ],
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      recBkg,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(214, 214, 214, 1)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isFeatured)
                Column(
                  children: [
                    Image.asset(
                      'assets/images/main_page/bottom_navigation_bar/badge.png',
                      height: 20,
                      color: isActive
                          ? const Color.fromRGBO(255, 206, 49, 1)
                          : Colors.white,
                    )
                  ],
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      offersTabCardModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: isActive
                            ? Colors.white
                            : const Color.fromRGBO(68, 68, 68, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      offersTabCardModel.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: isActive
                            ? Colors.white
                            : const Color.fromRGBO(68, 68, 68, 1),
                        fontSize: 10.79,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Posted on : 11/08/2022',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: isActive
                                ? Colors.white
                                : const Color.fromRGBO(68, 68, 68, 1),
                            fontSize: 9,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        isActive
                            ? const Text(
                                'Expires on : 02 : 30 : 42 Hours',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              )
                            : const Text(
                                'Expired',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 9,
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: isActive
                    ? Image(
                        width: 90,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          offersTabCardModel.imageAssetPath,
                        ),
                      )
                    : ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.saturation,
                        ),
                        child: Image(
                          width: 90,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            offersTabCardModel.imageAssetPath,
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

class OffersTabCardModel {
  String title = '';
  String description = '';
  String imageAssetPath = '';
  VoidCallback onTap;

  OffersTabCardModel(
      {required this.title,
      required this.description,
      required this.imageAssetPath,
      required this.onTap});
}
