import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

enum Gender { Male, Female, Other }

enum MaritalStatus { Married, Single }

enum Occupation { Business, Service, Other }

@freezed
class UserProfile with _$UserProfile {
  const UserProfile._();
  factory UserProfile({
    required int id,
    String? firstName,
    String? lastName,
    String? nickName,
    String? nationality,
    String? liveIn,
    String? phone,
    String? email,
    DateTime? birthday,
    Gender? gender,
    MaritalStatus? maritalStatus,
    Occupation? occupation,
    String? profileImage,
  }) = _UserProfile;
}
