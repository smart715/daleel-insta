import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';

/*
{
    "customer_id": "8",
    "location_id": "2",
    "category_id": "6",
    "package_id": "1",
    "name": "Emicon Technology",
    "email": "info@emicontech.com",
    "address": "Dubai",
    "contact_number": "01858361812",
    "short_description": "aaa",
    "website_link": "aaa",
    "office_hour": "9:00 to 17:00",
    "instagram_link": null,
    "twitter_link": null,
    "facebook_link": null,
    "youtube_link": null,
    "telegram_link": null,
    "payment_status": "Success",
    "image": {} // File Upload
}

*/
enum PaymentStatus { Success, Failure }

@freezed
class Company with _$Company {
  const Company._();
  const factory Company({
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
    PaymentStatus? paymentStatus,
    String? image,
  }) = _Company;
}
