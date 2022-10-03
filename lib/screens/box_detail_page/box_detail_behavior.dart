import 'package:dio/dio.dart';

class BoxDetailBehavior {
  static Future<Map<String, dynamic>> boxDetailResponseDataMapFuture = {} as Future<Map<String, dynamic>>;
  late Response<dynamic> boxDetailResponse;
}