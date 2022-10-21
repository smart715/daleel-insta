import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_daleel/domain/entities/user_profile.dart';
import 'package:insta_daleel/domain/repositories/repository.dart';
import 'package:insta_daleel/service_locator.dart';

final profileStateProvider = ChangeNotifierProvider.autoDispose((ref) {
  return ProfileStateController();
});

// @LazySingleton()
class ProfileStateController extends ChangeNotifier {
  ProfileStateController() {
    _init();
  }
  late UserProfile profile;
  _init() async {
    profile = serviceLocator<Repository>().getUserProfile();
  }

  setNewProfile(UserProfile p) {
    profile = p;
    notifyListeners();
  }

  updateProfile(UserProfile p, {File? image}) async {}
}
