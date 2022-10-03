import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetailBehavior {
  static VoidCallback setStateOfPostDetailListView = (){};
  static Future<Map<String, dynamic>> getPostDetailResponseDataMapFuture = {} as Future<Map<String, dynamic>>;
  late Response<dynamic> getPostDetailResponse;
  GlobalKey<ScaffoldState> bottomSheetKey = GlobalKey();
  late PersistentBottomSheetController bottomSheetController;
  Map<String, dynamic> getPostDetailResponseMap = {};

}