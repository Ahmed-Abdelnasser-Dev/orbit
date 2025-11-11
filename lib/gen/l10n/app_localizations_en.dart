// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Orbit';

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get welcomeMessage => 'Welcome to Orbit';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get onboardingWelcomeTitle => 'Welcome to Orbit';

  @override
  String get onboardingWelcomeSubtitle =>
      'Your personal journey to better health starts here';

  @override
  String get getStarted => 'Get Started';

  @override
  String get selectLanguageTitle => 'Choose your language';

  @override
  String get selectLanguageSubtitle => 'Select your preferred language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get selectThemeTitle => 'Choose your theme';

  @override
  String get selectThemeSubtitle => 'Pick a theme that suits you';

  @override
  String get lightMode => 'Light';

  @override
  String get darkMode => 'Dark';

  @override
  String get systemMode => 'System';

  @override
  String get authTitle => 'Let\'s get you started';

  @override
  String get authSubtitle => 'Create your account or sign in';

  @override
  String get loginButton => 'Log In';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String get permissionsTitle => 'Stay on track';

  @override
  String get permissionsSubtitle =>
      'Allow notifications to help you stay consistent with your goals';

  @override
  String get permissionsDescription =>
      'We\'ll send you friendly reminders to keep you motivated and on schedule';

  @override
  String get allowNotifications => 'Allow Notifications';

  @override
  String get notNow => 'Not Now';

  @override
  String get userDataTitle => 'Tell us about yourself';

  @override
  String get userDataSubtitle => 'This helps us personalize your experience';

  @override
  String get ageLabel => 'Age';

  @override
  String get ageHint => 'Enter your age';

  @override
  String get weightLabel => 'Weight (kg)';

  @override
  String get weightHint => 'Enter your weight';

  @override
  String get heightLabel => 'Height (cm)';

  @override
  String get heightHint => 'Enter your height';

  @override
  String get wakeUpTimeLabel => 'Wake up time';

  @override
  String get sleepTimeLabel => 'Sleep time';

  @override
  String get selectTime => 'Select time';

  @override
  String get continueButton => 'Continue';

  @override
  String get backButton => 'Back';

  @override
  String get finishButton => 'Finish';

  @override
  String get skipButton => 'Skip';

  @override
  String get errorInvalidAge => 'Please enter a valid age';

  @override
  String get errorInvalidWeight => 'Please enter a valid weight';

  @override
  String get errorInvalidHeight => 'Please enter a valid height';

  @override
  String get errorRequiredField => 'This field is required';

  @override
  String get welcomeBack => 'Welcome back,';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get work => 'Work';

  @override
  String get health => 'Health';

  @override
  String get mental => 'Mental';

  @override
  String get hobbies => 'Hobbies';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardSubtitle => 'Your daily overview';

  @override
  String get workTitle => 'Work';

  @override
  String get workSubtitle => 'Manage your productivity';

  @override
  String get healthTitle => 'Health';

  @override
  String get healthSubtitle => 'Track your physical wellness';

  @override
  String get mentalTitle => 'Mental';

  @override
  String get mentalSubtitle => 'Mindfulness and emotional health';

  @override
  String get hobbiesTitle => 'Hobbies';

  @override
  String get hobbiesSubtitle => 'Enjoy your passions';

  @override
  String get welcomeBackWarrior => 'Welcome back, Warrior!';

  @override
  String welcomeBackUser(String name) {
    return 'Welcome back, $name!';
  }

  @override
  String get motivationalQuote1 => 'Every step forward is progress.';

  @override
  String get motivationalQuote2 => 'Your journey to wellness starts now.';

  @override
  String get motivationalQuote3 => 'Small steps lead to big changes.';

  @override
  String get motivationalQuote4 => 'You\'re stronger than you think.';

  @override
  String get motivationalQuote5 => 'Believe in yourself and take action.';

  @override
  String get notifications => 'Notifications';

  @override
  String get menu => 'Menu';

  @override
  String get todayProgress => 'Today\'s Progress';

  @override
  String get workProgress => 'Work Tasks';

  @override
  String get healthProgress => 'Physical Health';

  @override
  String get mentalProgress => 'Mental Wellness';

  @override
  String get hobbiesProgress => 'Leisure Time';

  @override
  String tasksCompleted(int completed, int total) {
    return '$completed of $total tasks';
  }

  @override
  String minutesActive(int minutes) {
    return '$minutes min active';
  }

  @override
  String sessionsCompleted(int sessions) {
    return '$sessions sessions';
  }

  @override
  String hoursSpent(int hours) {
    return '${hours}h spent';
  }
}
