import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.title,
    required this.imageLink,
    required this.onTap,
  }) : super(key: key);

  final String title, imageLink;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.only(
          right: 13,
          left: 10,
          top: 12,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          // color: const Color(InstaDaleelColors.primaryColor),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/main_page/featured_page/cat_bkg.png',
            ),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.end,
                maxLines: 4,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset.zero,
                    blurRadius: 6,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  )
                ],
              ),
              child: Center(
                child: CachedNetworkImage(
                  height: 43,
                  width: 43,
                  fit: BoxFit.contain,
                  imageUrl: imageLink,
                  placeholder: (BuildContext context, String url) =>
                      const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                      child: Icon(
                    Icons.error_outline_outlined,
                    color: Colors.black,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
