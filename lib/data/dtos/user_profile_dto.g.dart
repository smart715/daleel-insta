// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) =>
    UserProfileDto(
      id: json['id'] as int,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      nickname: json['nickname'] as String?,
      nationality: json['nationality'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      birthday: json['birthday'] as String?,
      gender: json['gender'] as String?,
      marital_status: json['marital_status'] as String?,
      occupation: json['occupation'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserProfileDtoToJson(UserProfileDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstname', instance.firstname);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('nickname', instance.nickname);
  writeNotNull('nationality', instance.nationality);
  writeNotNull('address', instance.address);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('birthday', instance.birthday);
  writeNotNull('gender', instance.gender);
  writeNotNull('marital_status', instance.marital_status);
  writeNotNull('occupation', instance.occupation);
  writeNotNull('image', instance.image);
  return val;
}
