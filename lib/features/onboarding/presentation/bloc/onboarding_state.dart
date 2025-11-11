part of 'onboarding_bloc.dart';

/// Status of the onboarding flow.
enum OnboardingStatus {
  initial,
  loading,
  inProgress,
  completed,
  error,
}

/// State for the onboarding flow.
class OnboardingState extends Equatable {
  final OnboardingStatus status;
  final int currentStep;
  final String? selectedLanguage;
  final AppThemePreference? selectedTheme;
  final bool notificationsGranted;
  final UserProfile? userProfile;
  final String? errorMessage;

  const OnboardingState({
    required this.status,
    required this.currentStep,
    this.selectedLanguage,
    this.selectedTheme,
    this.notificationsGranted = false,
    this.userProfile,
    this.errorMessage,
  });

  const OnboardingState.initial()
      : status = OnboardingStatus.initial,
        currentStep = 0,
        selectedLanguage = null,
        selectedTheme = null,
        notificationsGranted = false,
        userProfile = null,
        errorMessage = null;

  OnboardingState copyWith({
    OnboardingStatus? status,
    int? currentStep,
    String? selectedLanguage,
    AppThemePreference? selectedTheme,
    bool? notificationsGranted,
    UserProfile? userProfile,
    String? errorMessage,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      currentStep: currentStep ?? this.currentStep,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedTheme: selectedTheme ?? this.selectedTheme,
      notificationsGranted: notificationsGranted ?? this.notificationsGranted,
      userProfile: userProfile ?? this.userProfile,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        currentStep,
        selectedLanguage,
        selectedTheme,
        notificationsGranted,
        userProfile,
        errorMessage,
      ];
}
