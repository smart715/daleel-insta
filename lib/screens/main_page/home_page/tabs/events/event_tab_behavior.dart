import 'package:dio/dio.dart';

class EventTabBehavior {
  static Future<List<dynamic>> eventResponseDataListFuture = [] as Future<List<dynamic>>;
  static bool isEventResponseDataListFutureLoaded = false;
  static Map<String, dynamic> eventDataMap = {};
  late Response<dynamic> eventResponse;
}