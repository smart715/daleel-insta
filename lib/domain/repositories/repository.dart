import 'package:insta_daleel/domain/entities/history_note.dart';
import 'package:insta_daleel/domain/entities/user_profile.dart';

abstract class Repository {
  Future<UserProfile> signIn(String phone, String password);
  Future<UserProfile> updateProfile(UserProfile profile);
  UserProfile getUserProfile();
  Future<List<HistoryNote>> getHistory();
}
