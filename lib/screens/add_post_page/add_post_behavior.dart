import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin AddPostBehavior {
  ScrollController scrollController = ScrollController();
  late Widget postButtonContent;
  final ImagePicker imagePicker = ImagePicker();
  bool isPosting = false;
  List<XFile>? postPicsList;

  List<MultipartFile> multipartFileList = [];
  TextEditingController postTextEditingController = TextEditingController();
 }