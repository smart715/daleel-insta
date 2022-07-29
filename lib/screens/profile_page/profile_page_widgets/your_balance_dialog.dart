import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';

AlertDialog showBalanceDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.transparent,
    content: Container(
      height: 340,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
          color: const Color(InstaDaleelColors.primaryColor),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Image(
                height: 40,
                image: AssetImage('assets/images/profile_page/1.png'),
              ),
              const SizedBox(height: 10,),
              const Text(
                'Your Balance',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 3,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 10,),
              const Text(
                'Your Balance Is Distributed As Follows',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20,),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Registration: ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: '3 Points',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                ),
              ),
              const SizedBox(height: 10,),
              RichText(
                text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Add A Place: : ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '0 Points',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                ),
              ),
              const SizedBox(height: 10,),
              RichText(
                text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Add A Place: ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '0 Points',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                ),
              ),
              const SizedBox(height: 10,),
              RichText(
                text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Add A Picture: ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '3 Points',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                ),
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
              child: Transform.rotate(
                angle: 4,
                child: const Icon(
                  Icons.add,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}