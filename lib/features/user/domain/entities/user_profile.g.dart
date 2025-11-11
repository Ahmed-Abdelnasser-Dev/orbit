// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
      age: (json['age'] as num).toInt(),
      weightKg: (json['weightKg'] as num).toDouble(),
      heightCm: (json['heightCm'] as num).toDouble(),
      wakeSleep: TimeOfDayWakeSleep.fromJson(
          json['wakeSleep'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'age': instance.age,
      'weightKg': instance.weightKg,
      'heightCm': instance.heightCm,
      'wakeSleep': instance.wakeSleep,
    };

_TimeOfDayWakeSleep _$TimeOfDayWakeSleepFromJson(Map<String, dynamic> json) =>
    _TimeOfDayWakeSleep(
      wakeUp: json['wakeUp'] as String,
      sleep: json['sleep'] as String,
    );

Map<String, dynamic> _$TimeOfDayWakeSleepToJson(_TimeOfDayWakeSleep instance) =>
    <String, dynamic>{
      'wakeUp': instance.wakeUp,
      'sleep': instance.sleep,
    };
