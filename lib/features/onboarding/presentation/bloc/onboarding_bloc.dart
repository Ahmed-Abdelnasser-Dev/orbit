import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../user/domain/entities/user_profile.dart';
import '../../../user/domain/entities/preferences.dart';
import '../../../user/domain/repositories/user_repository.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../../../../core/services/notification_service.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

/// BLoC managing the multi-step onboarding flow.
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository _onboardingRepository;
  final UserRepository _userRepository;
  final NotificationService _notificationService;

  OnboardingBloc({
    required OnboardingRepository onboardingRepository,
    required UserRepository userRepository,
    required NotificationService notificationService,
  })  : _onboardingRepository = onboardingRepository,
        _userRepository = userRepository,
        _notificationService = notificationService,
        super(const OnboardingState.initial()) {
    on<CheckOnboardingStatusEvent>(_onCheckStatus);
    on<SelectLanguageEvent>(_onSelectLanguage);
    on<SelectThemeEvent>(_onSelectTheme);
    on<RequestPermissionsEvent>(_onRequestPermissions);
    on<SaveUserDataEvent>(_onSaveUserData);
    on<CompleteOnboardingEvent>(_onCompleteOnboarding);
    on<GoToNextStepEvent>(_onGoToNextStep);
    on<GoToPreviousStepEvent>(_onGoToPreviousStep);
  }

  Future<void> _onCheckStatus(
    CheckOnboardingStatusEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(status: OnboardingStatus.loading));

    final result = await _onboardingRepository.isOnboardingCompleted();
    result.fold(
      (failure) => emit(state.copyWith(
        status: OnboardingStatus.error,
        errorMessage: failure.message,
      )),
      (completed) => emit(state.copyWith(
        status: completed
            ? OnboardingStatus.completed
            : OnboardingStatus.inProgress,
        currentStep: 0,
      )),
    );
  }

  Future<void> _onSelectLanguage(
    SelectLanguageEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(selectedLanguage: event.languageCode));
  }

  Future<void> _onSelectTheme(
    SelectThemeEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(selectedTheme: event.theme));
  }

  Future<void> _onRequestPermissions(
    RequestPermissionsEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(status: OnboardingStatus.loading));

    final granted = await _notificationService.requestPermission();
    emit(state.copyWith(
      status: OnboardingStatus.inProgress,
      notificationsGranted: granted,
    ));
  }

  Future<void> _onSaveUserData(
    SaveUserDataEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(userProfile: event.profile));
  }

  Future<void> _onCompleteOnboarding(
    CompleteOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(status: OnboardingStatus.loading));

    // Save preferences
    final preferences = Preferences(
      languageCode: state.selectedLanguage ?? 'en',
      theme: state.selectedTheme ?? AppThemePreference.system,
      notificationsAllowed: state.notificationsGranted,
    );

    final prefResult = await _userRepository.savePreferences(preferences);
    final saveError = prefResult.fold((l) => l.message, (r) => null);

    if (saveError != null) {
      emit(state.copyWith(
        status: OnboardingStatus.error,
        errorMessage: saveError,
      ));
      return;
    }

    // Save user profile
    if (state.userProfile != null) {
      final profileResult =
          await _userRepository.saveUserProfile(state.userProfile!);
      final profileError = profileResult.fold((l) => l.message, (r) => null);

      if (profileError != null) {
        emit(state.copyWith(
          status: OnboardingStatus.error,
          errorMessage: profileError,
        ));
        return;
      }
    }

    // Mark onboarding as complete
    final completeResult = await _onboardingRepository.completeOnboarding();
    completeResult.fold(
      (failure) => emit(state.copyWith(
        status: OnboardingStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(status: OnboardingStatus.completed)),
    );
  }

  void _onGoToNextStep(
    GoToNextStepEvent event,
    Emitter<OnboardingState> emit,
  ) {
    final nextStep = state.currentStep + 1;
    if (nextStep <= 5) {
      emit(state.copyWith(currentStep: nextStep));
    }
  }

  void _onGoToPreviousStep(
    GoToPreviousStepEvent event,
    Emitter<OnboardingState> emit,
  ) {
    final prevStep = state.currentStep - 1;
    if (prevStep >= 0) {
      emit(state.copyWith(currentStep: prevStep));
    }
  }
}
