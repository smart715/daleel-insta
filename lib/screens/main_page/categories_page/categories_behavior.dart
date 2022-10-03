import 'package:dio/dio.dart';

class AllCategoryBehavior{
  static Future<List<dynamic>> allCategoryResponseDataListFuture = [] as Future<List<dynamic>>;
  static List<dynamic> allCategoryResponseDataFilteredList = [];
  static List<dynamic> allCategoryResponseDataBackupList = [];
  static bool isAllCategoryResponseDataMapFutureLoaded = false;
  late Response<dynamic> allCategoryResponse;
  Map<String, dynamic> allCategoryResponseMap = {};
  List<dynamic> allCategoryDataList = [];
}