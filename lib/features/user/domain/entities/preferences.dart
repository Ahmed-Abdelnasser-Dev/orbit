import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences.freezed.dart';
part 'preferences.g.dart';

enum AppThemePreference { system, light, dark }

@freezed
abstract class Preferences with _$Preferences {
  const Preferences._();

  const factory Preferences({
    required String languageCode,
    required AppThemePreference theme,
    required bool notificationsAllowed,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
}
