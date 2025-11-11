part of 'user_bloc.dart';

/// Base class for all user events.
sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

/// Load user profile and preferences from storage.
class LoadUserDataEvent extends UserEvent {
  const LoadUserDataEvent();
}

/// Update user profile.
class UpdateUserProfileEvent extends UserEvent {
  final UserProfile profile;

  const UpdateUserProfileEvent(this.profile);

  @override
  List<Object?> get props => [profile];
}

/// Update user preferences.
class UpdatePreferencesEvent extends UserEvent {
  final Preferences preferences;

  const UpdatePreferencesEvent(this.preferences);

  @override
  List<Object?> get props => [preferences];
}

/// Update theme preference only.
class UpdateThemeEvent extends UserEvent {
  final AppThemePreference theme;

  const UpdateThemeEvent(this.theme);

  @override
  List<Object?> get props => [theme];
}

/// Update language preference only.
class UpdateLanguageEvent extends UserEvent {
  final String languageCode;

  const UpdateLanguageEvent(this.languageCode);

  @override
  List<Object?> get props => [languageCode];
}

/// Delete all user data.
class DeleteUserDataEvent extends UserEvent {
  const DeleteUserDataEvent();
}
