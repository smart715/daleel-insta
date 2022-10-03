import 'dart:ui';
import 'package:dio/dio.dart';

class GetSpecificPersonPostBehavior {

  static VoidCallback setStateOfSpecificPersonPostListView = (){};
  static Future<List<dynamic>> getSpecificPersonPostResponseDataListFuture = [] as Future<List<dynamic>>;
  late Response<dynamic> getSpecificPersonPostResponse;
  Map<String, dynamic> getSpecificPersonPostResponseMap = {};
  List<dynamic> getSpecificPersonPostDataList = [];
  Map<String, dynamic> getSpecificPersonPostDataMap = {};
}