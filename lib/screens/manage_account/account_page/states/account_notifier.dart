import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:insta_daleel/domain/entities/company.dart';
import 'package:insta_daleel/service_locator.dart';

final accountNotifierProvider =
    ChangeNotifierProvider((ref) => serviceLocator<AccountNotfier>());

@LazySingleton()
class AccountNotfier extends ChangeNotifier {
  AccountNotfier() {
    _initAccount();
  }
  List<Company> companies = [];

  _initAccount() async {}
}
