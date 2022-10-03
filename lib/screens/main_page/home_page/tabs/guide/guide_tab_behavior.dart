import 'dart:ui';

import 'package:dio/dio.dart';

class GuideTabBehavior {

  // ad banner section variables
  static Future<List<dynamic>> adBannerResponseDataListFuture = [] as Future<List<dynamic>>;
  static bool isAdBannerResponseDataListFutureLoaded = false;
  int adBannerSliderIndex = 0;
  late Response<dynamic> adBannerResponse;
  Map<String, dynamic> adBannerResponseMap = {};
  List<dynamic> adBannerDataList = [];

  // category section variables
  static Future<List<dynamic>> categoryResponseDataListFuture = [] as Future<List<dynamic>>;
  static bool isCategoryResponseDataListFutureLoaded = false;
  late Response<dynamic> categoryResponse;
  Map<String, dynamic> categoryResponseMap = {};
  List<dynamic> categoryDataList = [];

  // box section variables
  static Future<List<dynamic>> boxResponseDataListFuture = [] as Future<List<dynamic>>;
  static bool isBoxResponseDataListFutureLoaded = false;
  late Response<dynamic> boxResponse;
  Map<String, dynamic> boxResponseMap = {};
  List<dynamic> boxDataList = [];

  // latest post
  static int latestPostSliderIndex = 0;
  static Future<List<dynamic>> guideTabLatestPostResponseDataListFuture = [] as Future<List<dynamic>>;
  static bool isGuideTabLatestPostResponseDataListFutureLoaded = false;
  static VoidCallback setStateOfGuideTabLatestPostListView = (){};
  late Response<dynamic> guideTabLatestPostResponse;
  Map<String, dynamic> guideTabLatestPostResponseMap = {};
  List<dynamic> guideTabLatestPostDataList = [];
}