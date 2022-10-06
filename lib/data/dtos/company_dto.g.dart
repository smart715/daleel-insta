// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDto _$CompanyDtoFromJson(Map<String, dynamic> json) => CompanyDto(
      businessId: json['businessId'] as String?,
      customerId: json['customerId'] as String?,
      locationId: json['locationId'] as String?,
      categoryId: json['categoryId'] as String?,
      packageId: json['packageId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      contactNumber: json['contactNumber'] as String?,
      shortDescription: json['shortDescription'] as String?,
      websiteLink: json['websiteLink'] as String?,
      officeHours: json['officeHours'] as String?,
      instagramLink: json['instagramLink'] as String?,
      twitterLink: json['twitterLink'] as String?,
      facebookLink: json['facebookLink'] as String?,
      youtubeLink: json['youtubeLink'] as String?,
      telegramLink: json['telegramLink'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CompanyDtoToJson(CompanyDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('businessId', instance.businessId);
  writeNotNull('customerId', instance.customerId);
  writeNotNull('locationId', instance.locationId);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('packageId', instance.packageId);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('address', instance.address);
  writeNotNull('contactNumber', instance.contactNumber);
  writeNotNull('shortDescription', instance.shortDescription);
  writeNotNull('websiteLink', instance.websiteLink);
  writeNotNull('officeHours', instance.officeHours);
  writeNotNull('instagramLink', instance.instagramLink);
  writeNotNull('twitterLink', instance.twitterLink);
  writeNotNull('facebookLink', instance.facebookLink);
  writeNotNull('youtubeLink', instance.youtubeLink);
  writeNotNull('telegramLink', instance.telegramLink);
  writeNotNull('paymentStatus', instance.paymentStatus);
  writeNotNull('image', instance.image);
  return val;
}
