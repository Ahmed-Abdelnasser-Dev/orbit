import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// Basic user profile collected during onboarding.
@freezed
abstract class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    required int age,
    required double weightKg,
    required double heightCm,
    required TimeOfDayWakeSleep wakeSleep,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

/// Wake up and sleep times.
@freezed
abstract class TimeOfDayWakeSleep with _$TimeOfDayWakeSleep {
  const TimeOfDayWakeSleep._();

  const factory TimeOfDayWakeSleep({
    required String wakeUp, // HH:mm 24h
    required String sleep, // HH:mm 24h
  }) = _TimeOfDayWakeSleep;

  factory TimeOfDayWakeSleep.fromJson(Map<String, dynamic> json) =>
      _$TimeOfDayWakeSleepFromJson(json);
}
