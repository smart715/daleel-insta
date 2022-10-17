import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';

AlertDialog showPaymentDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.transparent,
    content: Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 20,
              ),
              Image(
                height: 75,
                image: AssetImage('assets/images/payment_page/successful.png'),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Your Payment has been done Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(InstaDaleelColors.primaryColor),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 26,
                color: Color(InstaDaleelColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
