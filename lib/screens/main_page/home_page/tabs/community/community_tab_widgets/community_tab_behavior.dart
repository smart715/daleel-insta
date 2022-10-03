import 'dart:ui';
import 'package:dio/dio.dart';

class CommunityTabBehavior {

  static VoidCallback setStateOfLatestPostListView = (){};
  static bool isFromCommunity = false;
  static Future<List<dynamic>> getLatestPostResponseDataListFuture = [] as Future<List<dynamic>>;
  static bool isGetLatestPostResponseDataMapFutureLoaded = false;
  late Response<dynamic> getLatestPostResponse;
  Map<String, dynamic> getLatestPostResponseMap = {};
  List<dynamic> getLatestPostDataList = [];
  static Map<String, dynamic> getLatestPostDataMap = {};
}