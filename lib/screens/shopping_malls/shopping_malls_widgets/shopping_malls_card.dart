import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../global_members.dart';

class ShoppingMallsCard extends StatelessWidget {
  const ShoppingMallsCard({Key? key, required this.title, required this.imagePath, required this.onTap}) : super(key: key);

  final String title, imagePath;
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
              Text(
                title,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Image(
                      height: 25,
                      width: 25,
                      image: AssetImage(
                        imagePath,
                      ),
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
