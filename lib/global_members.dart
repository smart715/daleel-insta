import 'package:dio/dio.dart';

// Dio dio = Dio(BaseOptions(baseUrl: 'https://insta-daleel.emicon.tech'));
// const baseUrl = 'https://insta-daleel.emicon.tech';
Dio dio = Dio(BaseOptions(baseUrl: 'http://laravel.test'));
const baseUrl = 'http://laravel.test';
const double leftRightGlobalMargin = 7.0;
String bearerToken = '', userName = '';
int userId = -1;
String? userProfilePicLink;
bool isKeyboardOpen = false;
typedef Validator = String? Function(String? value);
