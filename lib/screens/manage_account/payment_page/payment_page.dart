import 'package:flutter/material.dart';
import 'package:insta_daleel/global_members.dart';
import 'package:insta_daleel/screens/manage_account/payment_page/payment_dialog.dart';
import 'package:insta_daleel/screens/manage_account/payment_page/utils.dart';
import '../../../../../constants/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  static const String paymentPageRoute = 'PaymentPage';

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController promoCodeController = TextEditingController();
  PaymentMethodType selectedPaymentMethod = PaymentMethodType.None;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(InstaDaleelColors.backgroundColor),
      body: Column(
        children: [
          //app bar
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
                  'Payment',
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
                    const PaymentDetailsBanner(),
                    const SizedBox(
                      height: 10,
                    ),
                    PaymentDiscountInputs(
                      hintText: 'Use Promo Code',
                      textEditingController: promoCodeController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PaymentDiscountInputs(
                      hintText: 'Use Coin To Avail Discount',
                      textEditingController: promoCodeController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'Payment Method',
                            style: TextStyle(
                              color: Color(InstaDaleelColors.primaryColor),
                              fontSize: 16,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Column(
                        children: [
                          const Divider(
                            thickness: 0.7,
                            height: 1,
                            color: Color(0x66373737),
                          ),
                          PaymentMethodTile(
                            isActive:
                                selectedPaymentMethod == PaymentMethodType.Card,
                            title: 'Credit / Debit Card',
                            paymentMethod: PaymentMethodType.Card,
                            onTap: () {
                              setState(() {
                                selectedPaymentMethod =
                                    (selectedPaymentMethod ==
                                            PaymentMethodType.Card)
                                        ? PaymentMethodType.None
                                        : PaymentMethodType.Card;
                              });
                            },
                          ),
                          PaymentMethodTile(
                            isActive: selectedPaymentMethod ==
                                PaymentMethodType.Apple,
                            title: 'Apple Pay',
                            paymentMethod: PaymentMethodType.Apple,
                            onTap: () {
                              setState(() {
                                selectedPaymentMethod =
                                    (selectedPaymentMethod ==
                                            PaymentMethodType.Apple)
                                        ? PaymentMethodType.None
                                        : PaymentMethodType.Apple;
                              });
                            },
                          ),
                          PaymentMethodTile(
                            isActive: selectedPaymentMethod ==
                                PaymentMethodType.Google,
                            title: 'Google Pay',
                            paymentMethod: PaymentMethodType.Google,
                            onTap: () {
                              setState(() {
                                selectedPaymentMethod =
                                    (selectedPaymentMethod ==
                                            PaymentMethodType.Google)
                                        ? PaymentMethodType.None
                                        : PaymentMethodType.Google;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return showPaymentDialog(context);
                              },
                            );
                          },
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(submitBtnBkg),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Proceed',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    Key? key,
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.paymentMethod,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final PaymentMethodType paymentMethod;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 65,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0x66373737),
              width: 0.7,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              (paymentMethod == PaymentMethodType.Card)
                  ? card
                  : (paymentMethod == PaymentMethodType.Google)
                      ? google
                      : apple,
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xcc373737),
                      fontSize: 13,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xcc373737),
                      ),
                    ),
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
                                    recBkg,
                                  ),
                                ),
                              )
                            : BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaymentDetailsBanner extends StatelessWidget {
  const PaymentDetailsBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(paymentBannerBkg),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'PRICE DETAILS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'AED 120.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Subscription Fee',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'AED 00.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Promo Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
              height: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'AED 120.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentDiscountInputs extends StatelessWidget {
  const PaymentDiscountInputs({
    Key? key,
    required this.hintText,
    required this.textEditingController,
  }) : super(key: key);
  final String hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 50,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(buttonBkg),
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Center(
        child: TextFormField(
          validator: (value) {
            return null;
          },
          onChanged: (value) {},
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          onTap: () {
            isKeyboardOpen = true;
          },
          controller: textEditingController,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 14, color: Colors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 4),
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
            border: InputBorder.none,
          ),
          cursorColor: Colors.white,
        ),
      ),
    );
  }
}
