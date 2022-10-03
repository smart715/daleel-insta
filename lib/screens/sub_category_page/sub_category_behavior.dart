import 'package:dio/dio.dart';

class SubCategoryBehavior{
  static Future<List<dynamic>> subCategoryResponseDataListFuture = [] as Future<List<dynamic>>;
  static List<dynamic> subCategoryResponseDataFilteredList = [];
  static List<dynamic> subCategoryResponseDataBackupList = [];
  late Response<dynamic> subCategoryResponse;
  Map<String, dynamic> subCategoryResponseMap = {};
  List<dynamic> subCategoryDataList = [];
}