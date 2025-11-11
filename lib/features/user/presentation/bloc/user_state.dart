part of 'user_bloc.dart';

/// Status of user data operations.
enum UserStatus {
  initial,
  loading,
  loaded,
  error,
}

/// State for user profile and preferences.
class UserState extends Equatable {
  final UserStatus status;
  final UserProfile? profile;
  final Preferences? preferences;
  final String? errorMessage;

  const UserState({
    required this.status,
    this.profile,
    this.preferences,
    this.errorMessage,
  });

  const UserState.initial()
      : status = UserStatus.initial,
        profile = null,
        preferences = null,
        errorMessage = null;

  UserState copyWith({
    UserStatus? status,
    UserProfile? profile,
    Preferences? preferences,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      preferences: preferences ?? this.preferences,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        profile,
        preferences,
        errorMessage,
      ];
}
