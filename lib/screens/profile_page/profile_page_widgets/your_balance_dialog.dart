import 'package:flutter/material.dart';
import 'package:insta_daleel/constants/colors.dart';
import 'package:insta_daleel/domain/entities/history_note.dart';

AlertDialog showBalanceDialog(
    BuildContext context, List<HistoryNote> historyList) {
  return AlertDialog(
    backgroundColor: Colors.transparent,
    content: Container(
      height: 340,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
          color: const Color(InstaDaleelColors.primaryColor),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Image(
                height: 40,
                image: AssetImage('assets/images/profile_page/1.png'),
              ),
              const SizedBox(
                height: 10,
              ),
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
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Your Balance Is Distributed As Follows',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ...historyList
                  .map((record) => Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '${record.note}: ',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: '${record.amount} Points',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ))
                  .toList(),
              // RichText(
              //   text: const TextSpan(children: [
              //     TextSpan(
              //       text: 'Add A Place: : ',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //     TextSpan(
              //       text: '0 Points',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ]),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // RichText(
              //   text: const TextSpan(children: [
              //     TextSpan(
              //       text: 'Add A Place: ',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //     TextSpan(
              //       text: '0 Points',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ]),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // RichText(
              //   text: const TextSpan(children: [
              //     TextSpan(
              //       text: 'Add A Picture: ',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //     TextSpan(
              //       text: '3 Points',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ]),
              // ),
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
