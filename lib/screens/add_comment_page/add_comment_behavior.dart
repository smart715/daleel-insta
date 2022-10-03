import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin AddCommentBehavior {
  ScrollController scrollController = ScrollController();
  late Widget commentButtonContent;
  final ImagePicker imagePicker = ImagePicker();
  bool isPostingComment = false;
  List<XFile>? commentPicsList;

  List<MultipartFile> multipartFileList = [];
  TextEditingController commentTextEditingController = TextEditingController();
}