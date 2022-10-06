import 'package:insta_daleel/domain/entities/company.dart';
import 'package:insta_daleel/domain/entities/user_profile.dart';

T? enumFromString<T>(String? value) {
  if (value == null) return null;
  if (T == Gender) {
    return Gender.values.byName(value) as T;
  }
  if (T == MaritalStatus) {
    return MaritalStatus.values.byName(value) as T;
  }
  if (T == Occupation) {
    return Occupation.values.byName(value) as T;
  }
  if (T == PaymentStatus) {
    return PaymentStatus.values.byName(value) as T;
  }
  return null;
}
