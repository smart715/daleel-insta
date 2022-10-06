import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insta_daleel/data/dtos/utils.dart';
import 'package:insta_daleel/domain/entities/company.dart';

part 'company_dto.freezed.dart';
part 'company_dto.g.dart';

@freezed
@JsonSerializable(
    explicitToJson: true, createFactory: true, includeIfNull: false)
class CompanyDto with _$CompanyDto {
  const CompanyDto._();
  const factory CompanyDto({
    String? businessId,
    String? customerId,
    String? locationId,
    String? categoryId,
    String? packageId,
    String? name,
    String? email,
    String? address,
    String? contactNumber,
    String? shortDescription,
    String? websiteLink,
    String? officeHours,
    String? instagramLink,
    String? twitterLink,
    String? facebookLink,
    String? youtubeLink,
    String? telegramLink,
    String? paymentStatus,
    String? image,
  }) = _CompanyDto;

  factory CompanyDto.fromJson(Map<String, dynamic> json) {
    return _$CompanyDtoFromJson(json);
  }

  factory CompanyDto.fromDomain(Company c) {
    return CompanyDto(
      businessId: c.businessId,
      customerId: c.customerId,
      locationId: c.locationId,
      categoryId: c.categoryId,
      packageId: c.packageId,
      name: c.name,
      email: c.email,
      address: c.address,
      contactNumber: c.contactNumber,
      shortDescription: c.shortDescription,
      websiteLink: c.websiteLink,
      officeHours: c.officeHours,
      instagramLink: c.instagramLink,
      twitterLink: c.twitterLink,
      facebookLink: c.facebookLink,
      youtubeLink: c.youtubeLink,
      telegramLink: c.telegramLink,
      paymentStatus: c.paymentStatus?.name,
      image: c.image,
    );
  }

  Company toDomain() {
    return Company(
      businessId: businessId,
      customerId: customerId,
      locationId: locationId,
      categoryId: categoryId,
      packageId: packageId,
      name: name,
      email: email,
      address: address,
      contactNumber: contactNumber,
      shortDescription: shortDescription,
      websiteLink: websiteLink,
      officeHours: officeHours,
      instagramLink: instagramLink,
      twitterLink: twitterLink,
      facebookLink: facebookLink,
      youtubeLink: youtubeLink,
      telegramLink: telegramLink,
      paymentStatus: enumFromString<PaymentStatus>(paymentStatus),
      image: image,
    );
  }

  Map<String, dynamic> toJson() {
    return _$CompanyDtoToJson(this);
  }
}
