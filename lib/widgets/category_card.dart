import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../global_members.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.title, required this.imageLink, required this.onTap}) : super(key: key);

  final String title, imageLink;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(top: 15, left: leftRightGlobalMargin, right: leftRightGlobalMargin), // it was 10.0
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 90,
          width: 160,
          decoration: BoxDecoration(
            color: const Color(InstaDaleelColors.primaryColor),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20,),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: CachedNetworkImage(
                    height: 25,
                    width: 25,
                    fit: BoxFit.fill,
                    imageUrl: imageLink,
                    placeholder: (BuildContext context, String url) => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error_outline_outlined, color: Colors.black,)),
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
