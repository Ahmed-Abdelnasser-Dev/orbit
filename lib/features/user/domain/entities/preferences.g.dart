// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Preferences _$PreferencesFromJson(Map<String, dynamic> json) => _Preferences(
      languageCode: json['languageCode'] as String,
      theme: $enumDecode(_$AppThemePreferenceEnumMap, json['theme']),
      notificationsAllowed: json['notificationsAllowed'] as bool,
    );

Map<String, dynamic> _$PreferencesToJson(_Preferences instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'theme': _$AppThemePreferenceEnumMap[instance.theme]!,
      'notificationsAllowed': instance.notificationsAllowed,
    };

const _$AppThemePreferenceEnumMap = {
  AppThemePreference.system: 'system',
  AppThemePreference.light: 'light',
  AppThemePreference.dark: 'dark',
};
