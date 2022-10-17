import 'package:flutter/material.dart';
import 'package:insta_daleel/global_members.dart';
import 'package:insta_daleel/screens/manage_account/delete/delete_ui.dart';
import 'package:insta_daleel/screens/manage_account/payment_page/payment_page.dart';
import '../../../../constants/colors.dart';

class ManageActivation extends StatefulWidget {
  const ManageActivation({Key? key}) : super(key: key);

  // static const String manageActivationRoute = 'ManageActivation';

  @override
  State<ManageActivation> createState() => _ManageActivationState();
}

class _ManageActivationState extends State<ManageActivation> {
  int currentActive = -1;
  int activePlan = 1;
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
                  'Manage Activation',
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
              padding: const EdgeInsets.only(top: 15),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PaymentType(
                      title: 'Subscription payment',
                      isActive: currentActive == 0 ? true : false,
                      id: 0,
                      currentActivePlan: activePlan,
                      toggle: (_) {
                        setState(() {
                          currentActive = (currentActive == 0) ? -1 : 0;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PaymentType(
                      title: 'Pay for top',
                      isActive: currentActive == 10 ? true : false,
                      id: 10,
                      currentActivePlan: activePlan,
                      toggle: (_) {
                        setState(() {
                          currentActive = (currentActive == 10) ? -1 : 10;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PaymentType(
                      title: 'Pay for pin',
                      isActive: currentActive == 20 ? true : false,
                      id: 20,
                      currentActivePlan: activePlan,
                      toggle: (_) {
                        setState(() {
                          currentActive = (currentActive == 20) ? -1 : 20;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PaymentType(
                      title: 'Pay for feature',
                      isActive: currentActive == 30 ? true : false,
                      id: 30,
                      currentActivePlan: activePlan,
                      toggle: (_) {
                        setState(() {
                          currentActive = (currentActive == 30) ? -1 : 30;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DeleteTicket()));
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(buttonBkg),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Delete My Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.delete_outlined,
                              color: Colors.white,
                              size: 22,
                            ),
                          ],
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

class PaymentType extends StatefulWidget {
  const PaymentType({
    Key? key,
    required this.title,
    required this.isActive,
    required this.id,
    required this.toggle,
    this.currentActivePlan = -1,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final int id;
  final Function(int pos) toggle;
  final int currentActivePlan;

  @override
  State<PaymentType> createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  @override
  Widget build(BuildContext context) {
    double bannerHeight = 75;
    double bannerBorderRadius = 18;
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'ManageAccount');
        widget.toggle(widget.id);
      },
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(bannerBorderRadius),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: widget.isActive
                ? bannerHeight + (4 * PaymentTile.height)
                : bannerHeight,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  top: bannerHeight,
                  left: 0,
                  child: SizedBox(
                    height: 4 * PaymentTile.height,
                    width: MediaQuery.of(context).size.width - 30,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          PaymentTile(
                            title: '1 Month Subscription (120 AED)',
                            isActive:
                                widget.currentActivePlan == (widget.id + 0)
                                    ? true
                                    : false,
                            index: widget.id + 0,
                            onTap: (_) {},
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: const Divider(
                              thickness: 0.7,
                              height: 2,
                              color: Color(0xffE0E0E0),
                            ),
                          ),
                          PaymentTile(
                            title: '4 Month Subscription (120 AED)',
                            isActive:
                                widget.currentActivePlan == (widget.id + 1)
                                    ? true
                                    : false,
                            index: widget.id + 1,
                            onTap: (_) {},
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: const Divider(
                              thickness: 0.7,
                              height: 2,
                              color: Color(0xffE0E0E0),
                            ),
                          ),
                          PaymentTile(
                            title: '6 Month Subscription (120 AED)',
                            isActive:
                                widget.currentActivePlan == (widget.id + 2)
                                    ? true
                                    : false,
                            index: widget.id + 2,
                            onTap: (_) {},
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: const Divider(
                              thickness: 0.7,
                              height: 2,
                              color: Color(0xffE0E0E0),
                            ),
                          ),
                          PaymentTile(
                            title: '12 Month Subscription (120 AED)',
                            isActive:
                                widget.currentActivePlan == (widget.id + 3)
                                    ? true
                                    : false,
                            index: widget.id + 3,
                            onTap: (_) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(bannerBorderRadius),
                  child: Container(
                    alignment: Alignment.center,
                    height: bannerHeight,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          recBkg,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            widget.isActive
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            size: 35,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentTile extends StatelessWidget {
  const PaymentTile({
    Key? key,
    required this.title,
    required this.isActive,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final int index;
  final Function(int pos) onTap;
  static const double height = 60;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 35,
        // color: Colors.red,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        // color: Colors.blue,
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
                      // shape: const RoundedRectangleBorder(),
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
                                        recBkg,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 2.5),
                    child: Text(
                      title, //'1 Month Subscription (120 AED)',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // onTap(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  ),
                );
              },
              child: Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      recBkg,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    isActive ? 'Renew' : 'Purchase',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
