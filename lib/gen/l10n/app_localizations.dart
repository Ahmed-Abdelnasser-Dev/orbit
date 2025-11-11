import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Orbit'**
  String get appTitle;

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Orbit'**
  String get welcomeMessage;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Orbit'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your personal journey to better health starts here'**
  String get onboardingWelcomeSubtitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @selectLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get selectLanguageTitle;

  /// No description provided for @selectLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get selectLanguageSubtitle;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @selectThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your theme'**
  String get selectThemeTitle;

  /// No description provided for @selectThemeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a theme that suits you'**
  String get selectThemeSubtitle;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkMode;

  /// No description provided for @systemMode.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemMode;

  /// No description provided for @authTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get you started'**
  String get authTitle;

  /// No description provided for @authSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account or sign in'**
  String get authSubtitle;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginButton;

  /// No description provided for @signUpButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpButton;

  /// No description provided for @skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// No description provided for @permissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay on track'**
  String get permissionsTitle;

  /// No description provided for @permissionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications to help you stay consistent with your goals'**
  String get permissionsSubtitle;

  /// No description provided for @permissionsDescription.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send you friendly reminders to keep you motivated and on schedule'**
  String get permissionsDescription;

  /// No description provided for @allowNotifications.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get allowNotifications;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get notNow;

  /// No description provided for @userDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself'**
  String get userDataTitle;

  /// No description provided for @userDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us personalize your experience'**
  String get userDataSubtitle;

  /// No description provided for @ageLabel.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageLabel;

  /// No description provided for @ageHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your age'**
  String get ageHint;

  /// No description provided for @weightLabel.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weightLabel;

  /// No description provided for @weightHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your weight'**
  String get weightHint;

  /// No description provided for @heightLabel.
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get heightLabel;

  /// No description provided for @heightHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your height'**
  String get heightHint;

  /// No description provided for @wakeUpTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Wake up time'**
  String get wakeUpTimeLabel;

  /// No description provided for @sleepTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Sleep time'**
  String get sleepTimeLabel;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Select time'**
  String get selectTime;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @finishButton.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finishButton;

  /// No description provided for @skipButton.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipButton;

  /// No description provided for @errorInvalidAge.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid age'**
  String get errorInvalidAge;

  /// No description provided for @errorInvalidWeight.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid weight'**
  String get errorInvalidWeight;

  /// No description provided for @errorInvalidHeight.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid height'**
  String get errorInvalidHeight;

  /// No description provided for @errorRequiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get errorRequiredField;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back,'**
  String get welcomeBack;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @mental.
  ///
  /// In en, this message translates to:
  /// **'Mental'**
  String get mental;

  /// No description provided for @hobbies.
  ///
  /// In en, this message translates to:
  /// **'Hobbies'**
  String get hobbies;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @dashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your daily overview'**
  String get dashboardSubtitle;

  /// No description provided for @workTitle.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get workTitle;

  /// No description provided for @workSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your productivity'**
  String get workSubtitle;

  /// No description provided for @healthTitle.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get healthTitle;

  /// No description provided for @healthSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your physical wellness'**
  String get healthSubtitle;

  /// No description provided for @mentalTitle.
  ///
  /// In en, this message translates to:
  /// **'Mental'**
  String get mentalTitle;

  /// No description provided for @mentalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Mindfulness and emotional health'**
  String get mentalSubtitle;

  /// No description provided for @hobbiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Hobbies'**
  String get hobbiesTitle;

  /// No description provided for @hobbiesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoy your passions'**
  String get hobbiesSubtitle;

  /// No description provided for @welcomeBackWarrior.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, Warrior!'**
  String get welcomeBackWarrior;

  /// No description provided for @welcomeBackUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {name}!'**
  String welcomeBackUser(String name);

  /// No description provided for @motivationalQuote1.
  ///
  /// In en, this message translates to:
  /// **'Every step forward is progress.'**
  String get motivationalQuote1;

  /// No description provided for @motivationalQuote2.
  ///
  /// In en, this message translates to:
  /// **'Your journey to wellness starts now.'**
  String get motivationalQuote2;

  /// No description provided for @motivationalQuote3.
  ///
  /// In en, this message translates to:
  /// **'Small steps lead to big changes.'**
  String get motivationalQuote3;

  /// No description provided for @motivationalQuote4.
  ///
  /// In en, this message translates to:
  /// **'You\'re stronger than you think.'**
  String get motivationalQuote4;

  /// No description provided for @motivationalQuote5.
  ///
  /// In en, this message translates to:
  /// **'Believe in yourself and take action.'**
  String get motivationalQuote5;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @todayProgress.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Progress'**
  String get todayProgress;

  /// No description provided for @workProgress.
  ///
  /// In en, this message translates to:
  /// **'Work Tasks'**
  String get workProgress;

  /// No description provided for @healthProgress.
  ///
  /// In en, this message translates to:
  /// **'Physical Health'**
  String get healthProgress;

  /// No description provided for @mentalProgress.
  ///
  /// In en, this message translates to:
  /// **'Mental Wellness'**
  String get mentalProgress;

  /// No description provided for @hobbiesProgress.
  ///
  /// In en, this message translates to:
  /// **'Leisure Time'**
  String get hobbiesProgress;

  /// No description provided for @tasksCompleted.
  ///
  /// In en, this message translates to:
  /// **'{completed} of {total} tasks'**
  String tasksCompleted(int completed, int total);

  /// No description provided for @minutesActive.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min active'**
  String minutesActive(int minutes);

  /// No description provided for @sessionsCompleted.
  ///
  /// In en, this message translates to:
  /// **'{sessions} sessions'**
  String sessionsCompleted(int sessions);

  /// No description provided for @hoursSpent.
  ///
  /// In en, this message translates to:
  /// **'{hours}h spent'**
  String hoursSpent(int hours);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
