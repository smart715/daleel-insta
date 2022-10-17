import 'package:flutter/material.dart';

class SupportOptionTile extends StatelessWidget {
  const SupportOptionTile({
    Key? key,
    required this.title,
    required this.isActive,
    required this.index,
    required this.select,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final int index;
  final Function(int pos) select;
  static const double height = 60;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        select(index);
      },
      child: Container(
        height: 35,
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      child: Container(
                        width: 18,
                        height: 18,
                        padding: const EdgeInsets.all(2),
                        child: Center(
                          child: Container(
                            decoration: isActive
                                ? BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        "assets/images/nav/nav_bkg.png",
                                      ),
                                    ),
                                  )
                                : BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.5),
                      child: Text(
                        title, //'1 Month Subscription (120 AED)',
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
