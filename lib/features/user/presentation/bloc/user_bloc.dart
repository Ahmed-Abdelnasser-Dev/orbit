import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/entities/preferences.dart';
import '../../domain/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

/// BLoC managing user profile and preferences across the app.
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _repository;

  UserBloc({required UserRepository repository})
      : _repository = repository,
        super(const UserState.initial()) {
    on<LoadUserDataEvent>(_onLoadUserData);
    on<UpdateUserProfileEvent>(_onUpdateUserProfile);
    on<UpdatePreferencesEvent>(_onUpdatePreferences);
    on<UpdateThemeEvent>(_onUpdateTheme);
    on<UpdateLanguageEvent>(_onUpdateLanguage);
    on<DeleteUserDataEvent>(_onDeleteUserData);
  }

  Future<void> _onLoadUserData(
    LoadUserDataEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));

    final profileResult = await _repository.getUserProfile();
    final prefsResult = await _repository.getPreferences();

    UserProfile? profile;
    Preferences? preferences;
    String? errorMessage;

    profileResult.fold(
      (failure) => errorMessage = failure.message,
      (data) => profile = data,
    );

    prefsResult.fold(
      (failure) => errorMessage ??= failure.message,
      (data) => preferences = data,
    );

    if (errorMessage != null) {
      emit(state.copyWith(
        status: UserStatus.error,
        errorMessage: errorMessage,
      ));
    } else {
      emit(state.copyWith(
        status: UserStatus.loaded,
        profile: profile,
        preferences: preferences,
      ));
    }
  }

  Future<void> _onUpdateUserProfile(
    UpdateUserProfileEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));

    final result = await _repository.updateUserProfile(event.profile);

    result.fold(
      (failure) => emit(state.copyWith(
        status: UserStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(
        status: UserStatus.loaded,
        profile: event.profile,
      )),
    );
  }

  Future<void> _onUpdatePreferences(
    UpdatePreferencesEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));

    final result = await _repository.updatePreferences(event.preferences);

    result.fold(
      (failure) => emit(state.copyWith(
        status: UserStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(
        status: UserStatus.loaded,
        preferences: event.preferences,
      )),
    );
  }

  Future<void> _onUpdateTheme(
    UpdateThemeEvent event,
    Emitter<UserState> emit,
  ) async {
    // Create preferences if they don't exist
    final currentPrefs = state.preferences ??
        const Preferences(
          languageCode: 'en',
          theme: AppThemePreference.system,
          notificationsAllowed: false,
        );

    final updatedPrefs = currentPrefs.copyWith(theme: event.theme);
    final result = await _repository.updatePreferences(updatedPrefs);

    result.fold(
      (failure) => emit(state.copyWith(
        status: UserStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(preferences: updatedPrefs)),
    );
  }

  Future<void> _onUpdateLanguage(
    UpdateLanguageEvent event,
    Emitter<UserState> emit,
  ) async {
    // Create preferences if they don't exist
    final currentPrefs = state.preferences ??
        const Preferences(
          languageCode: 'en',
          theme: AppThemePreference.system,
          notificationsAllowed: false,
        );

    final updatedPrefs =
        currentPrefs.copyWith(languageCode: event.languageCode);
    final result = await _repository.updatePreferences(updatedPrefs);

    result.fold(
      (failure) => emit(state.copyWith(
        status: UserStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(preferences: updatedPrefs)),
    );
  }

  Future<void> _onDeleteUserData(
    DeleteUserDataEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));

    final result = await _repository.deleteUserProfile();

    result.fold(
      (failure) => emit(state.copyWith(
        status: UserStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(const UserState.initial()),
    );
  }
}
