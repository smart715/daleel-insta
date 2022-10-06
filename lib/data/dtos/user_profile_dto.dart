import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insta_daleel/data/dtos/utils.dart';
import 'package:insta_daleel/domain/entities/user_profile.dart';

part 'user_profile_dto.freezed.dart';
part 'user_profile_dto.g.dart';

@freezed
@JsonSerializable(
    explicitToJson: true, createFactory: true, includeIfNull: false)
class UserProfileDto with _$UserProfileDto {
  const UserProfileDto._();
  factory UserProfileDto({
    required int id,
    String? firstname,
    String? lastname,
    String? nickname,
    String? nationality,
    String? address,
    String? phone,
    String? email,
    String? birthday,
    String? gender,
    String? marital_status,
    String? occupation,
    String? image,
  }) = _UserProfileDto;

  factory UserProfileDto.fromJson(Map<String, dynamic> json) {
    return _$UserProfileDtoFromJson(json);
  }

  factory UserProfileDto.fromDomain(UserProfile usr) {
    return UserProfileDto(
      id: usr.id,
      firstname: usr.firstName,
      lastname: usr.lastName,
      nickname: usr.nickName,
      nationality: usr.nationality,
      address: usr.liveIn,
      phone: usr.phone,
      email: usr.email,
      gender: usr.gender?.name,
      birthday:
          '${usr.birthday!.year}-${usr.birthday!.month}-${usr.birthday!.day}',
      marital_status: usr.maritalStatus?.name,
      occupation: usr.occupation?.name,
      image: usr.profileImage,
    );
  }

  UserProfile toDomain() {
    return UserProfile(
      id: id,
      firstName: firstname,
      lastName: lastname,
      nickName: nickname,
      nationality: nationality,
      liveIn: address,
      phone: phone,
      email: email,
      gender: enumFromString<Gender>(gender),
      birthday: _getBirthDay(),
      maritalStatus: enumFromString<MaritalStatus>(marital_status),
      occupation: enumFromString<Occupation>(occupation),
      profileImage: (image != null)
          ? 'https://insta-daleel.emicon.tech/images/customer/$image'
          : null,
    );
  }

  DateTime? _getBirthDay() {
    List<String>? d = birthday?.split('-');
    if (d == null) {
      return null;
    }
    return DateTime(int.parse(d[0]), int.parse(d[1]), int.parse(d[2]));
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileDtoToJson(this);
  }
}
