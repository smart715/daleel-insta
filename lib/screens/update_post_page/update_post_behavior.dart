import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin UpdatePostBehavior {
  ScrollController scrollController = ScrollController();
  late Widget updateButtonContent;
  final ImagePicker imagePicker = ImagePicker();
  bool isUpdating = false;
  List<XFile>? updatePicsList;

  List<MultipartFile> multipartFileList = [];
  TextEditingController updatePostTextEditingController = TextEditingController();
}