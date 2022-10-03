import 'package:dio/dio.dart';

Dio dio = Dio(BaseOptions(baseUrl: 'https://insta-daleel.emicon.tech'));
const baseUrl = 'https://insta-daleel.emicon.tech';
const double leftRightGlobalMargin = 7.0;
String bearerToken = '', userName = '';
int userId = -1;
String? userProfilePicLink;
bool isKeyboardOpen = false;
typedef Validator = String? Function(String? value);
