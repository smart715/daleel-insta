import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:insta_daleel/commons/network/api_client.dart';
import 'package:insta_daleel/data/datasources/user_in_memory_cache.dart';
import 'package:insta_daleel/data/dtos/history_note_dto.dart';
import 'package:insta_daleel/data/dtos/user_profile_dto.dart';

@lazySingleton
class RemoteDataSource with InMemoryUserCache {
  final ApiClient apiClient;
  RemoteDataSource({required this.apiClient});

  Future<UserProfileDto> signIn(String phone, String password) async {
    try {
      final profileMap =
          await apiClient.signIn({'phone': phone, 'password': password});
      final p = UserProfileDto.fromJson(profileMap);
      setProfile(p);
      return p;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileDto> updateProfile(UserProfileDto profile) async {
    final cachedProfile = getCachedProfile();
    if (profile != cachedProfile) {
      try {
        final profileMap = await apiClient.updateProfile(profile.toJson());
        final p = UserProfileDto.fromJson(profileMap);
        setProfile(p);
        return p;
      } catch (e) {
        rethrow;
      }
    } else {
      debugPrint('Profile has not changed');
      return cachedProfile!;
    }
  }

  Future<List<HistoryNoteDto>> getHistory(int id) async {
    try {
      final historyNoteList =
          (await apiClient.getHistory()).map((e) => HistoryNoteDto.fromJson(e));
      return historyNoteList
          .where((history) => history.customer_id == id)
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
