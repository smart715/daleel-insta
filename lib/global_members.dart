import 'package:dio/dio.dart';

Dio dio = Dio(BaseOptions(baseUrl: 'https://insta-daleel.emicon.tech'));
const double leftRightGlobalMargin = 7.0;
String bearerToken = '', userName = '';
int userId = -1;
String? userProfilePicLink;
bool isKeyboardOpen = false;
typedef Validator = String? Function(String? value);
const String buttonBkg =
    'assets/images/sign_in_sign_up_screens/sign_in_sign_up_text_field_background.png';
const String profileBtnBkg = 'assets/images/profile_page/bkg.png';
const String submitBtnBkg = 'assets/images/company_page/btn_bkg.png';
const String companyCardBkg = 'assets/images/company_page/card_bkg.png';
const String recBkg = 'assets/images/company_page/rec.png';
const String paymentBannerBkg = 'assets/images/payment_page/payment_banner.png';
