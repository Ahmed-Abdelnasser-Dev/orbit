part of 'onboarding_bloc.dart';

/// Base class for all onboarding events.
sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

/// Check if onboarding has been completed.
class CheckOnboardingStatusEvent extends OnboardingEvent {
  const CheckOnboardingStatusEvent();
}

/// User selected a language.
class SelectLanguageEvent extends OnboardingEvent {
  final String languageCode;

  const SelectLanguageEvent(this.languageCode);

  @override
  List<Object?> get props => [languageCode];
}

/// User selected a theme.
class SelectThemeEvent extends OnboardingEvent {
  final AppThemePreference theme;

  const SelectThemeEvent(this.theme);

  @override
  List<Object?> get props => [theme];
}

/// Request notification permissions.
class RequestPermissionsEvent extends OnboardingEvent {
  const RequestPermissionsEvent();
}

/// User provided their profile data.
class SaveUserDataEvent extends OnboardingEvent {
  final UserProfile profile;

  const SaveUserDataEvent(this.profile);

  @override
  List<Object?> get props => [profile];
}

/// Complete the onboarding flow.
class CompleteOnboardingEvent extends OnboardingEvent {
  const CompleteOnboardingEvent();
}

/// Navigate to next onboarding step.
class GoToNextStepEvent extends OnboardingEvent {
  const GoToNextStepEvent();
}

/// Navigate to previous onboarding step.
class GoToPreviousStepEvent extends OnboardingEvent {
  const GoToPreviousStepEvent();
}
