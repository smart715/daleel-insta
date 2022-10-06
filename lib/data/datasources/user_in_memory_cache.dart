import 'package:insta_daleel/data/dtos/user_profile_dto.dart';

mixin InMemoryUserCache {
  UserProfileDto? _userProfileDto;

  void setProfile(UserProfileDto profile) => _userProfileDto = profile;
  UserProfileDto? getCachedProfile() => _userProfileDto;
}
