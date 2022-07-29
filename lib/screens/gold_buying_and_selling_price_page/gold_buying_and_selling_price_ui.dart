import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../global_members.dart';

class GoldBuyingAndSellingPrice extends StatefulWidget {
  const GoldBuyingAndSellingPrice({Key? key}) : super(key: key);
  static const String goldBuyingAndSellingPriceRoute = 'GoldBuyingAndSellingPrice';

  @override
  State<GoldBuyingAndSellingPrice> createState() => _GoldBuyingAndSellingPriceState();
}

class _GoldBuyingAndSellingPriceState extends State<GoldBuyingAndSellingPrice> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // app bar
        SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(InstaDaleelColors.primaryColor),
              ),
            ),
            title: const Center(
              child: Text(
                'Gold Buying & Selling\nPrice',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(InstaDaleelColors.primaryColor),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            trailing: SizedBox(
              height: 45,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                  image: AssetImage(
                      'assets/images/main_page/app_bar/main_screen_appbar_help_info_icon.png'),
                ),
              ),
            ),
          ),
        ),
        // body
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // event detail image
                  const Image(
                    image: AssetImage(
                      'assets/images/gold_buying_and_selling_price/gold.png',
                    ),
                  ),

                  // 'Annual Musical Event' text
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(left: leftRightGlobalMargin),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(text: 'Author:', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' Richy'),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Published: 22/02/22',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10, bottom: 7),
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.share_outlined,
                                  color: Color(InstaDaleelColors.primaryColor),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ),

                  // event detail text
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: leftRightGlobalMargin),
                    alignment: Alignment.center,
                    child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet laoreet dictum nec, molestie. Eget felis turpis dui, scelerisque volutpat odio venenatis. Interdum quis malesuada cras commodo justo, lectus et. Sit placerat mauris erat quam feugiat aliquam in est. Odio quis eget eget morbi sed. Dolor curabitur in nulla ut leo vitae. Egestas varius blandit turpis facilisis diam. Nulla id ac faucibus viverra urna euismod. Nisl at scelerisque sem egestas faucibus. Non sed ridiculus senectus turpis nunc ut etiam. Pellentesque sed ullamcorper aliquam urna augue vitae bibendum. molestie. Eget felis turpis dui, scelerisque volutpat odio venenatis. Interdum quis malesuada cras commodo justo, lectus et. Sit placerat mauris erat quam feugiat aliquam in est. Odio quis eget eget morbi sed. Dolor curabitur in nulla ut leo vitae. Egestas varius blandit turpis facilisis diam. Nulla id ac faucibus viverra urna euismod. Nisl at scelerisque sem egestas faucibus. Non sed ridiculus senectus turpis nunc ut etiam. Pellentesque sed ullamcorper aliquam urna augue vitae bibendum. ',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
