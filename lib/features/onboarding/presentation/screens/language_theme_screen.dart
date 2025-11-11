import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../gen/l10n/app_localizations.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_spacing.dart';
import '../../../user/domain/entities/preferences.dart';
import '../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/selection_card.dart';

/// Language and Theme selection screen.
class LanguageThemeScreen extends StatelessWidget {
  final VoidCallback onContinue;

  const LanguageThemeScreen({
    super.key,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.s24),
          child: BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              final selectedLanguage = state.selectedLanguage ?? 'en';
              final selectedTheme =
                  state.selectedTheme ?? AppThemePreference.system;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.s16),
                  // Language Section
                  Text(
                    t.selectLanguageTitle,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.whiteSoft
                          : AppColors.backgroundDark,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s8),
                  Text(
                    t.selectLanguageSubtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.bodyText,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s24),
                  // Language Options
                  SelectionCard(
                    title: t.english,
                    icon: Icons.language,
                    isSelected: selectedLanguage == 'en',
                    onTap: () {
                      context.read<OnboardingBloc>().add(
                            const SelectLanguageEvent('en'),
                          );
                    },
                  ),
                  SizedBox(height: AppSpacing.s12),
                  SelectionCard(
                    title: t.arabic,
                    icon: Icons.language,
                    isSelected: selectedLanguage == 'ar',
                    onTap: () {
                      context.read<OnboardingBloc>().add(
                            const SelectLanguageEvent('ar'),
                          );
                    },
                  ),
                  SizedBox(height: AppSpacing.s32),
                  // Theme Section
                  Text(
                    t.selectThemeTitle,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.whiteSoft
                          : AppColors.backgroundDark,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s8),
                  Text(
                    t.selectThemeSubtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.bodyText,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s24),
                  // Theme Options
                  SelectionCard(
                    title: t.lightMode,
                    icon: Icons.light_mode,
                    isSelected: selectedTheme == AppThemePreference.light,
                    onTap: () {
                      context.read<OnboardingBloc>().add(
                            SelectThemeEvent(AppThemePreference.light),
                          );
                    },
                  ),
                  SizedBox(height: AppSpacing.s12),
                  SelectionCard(
                    title: t.darkMode,
                    icon: Icons.dark_mode,
                    isSelected: selectedTheme == AppThemePreference.dark,
                    onTap: () {
                      context.read<OnboardingBloc>().add(
                            SelectThemeEvent(AppThemePreference.dark),
                          );
                    },
                  ),
                  SizedBox(height: AppSpacing.s12),
                  SelectionCard(
                    title: t.systemMode,
                    icon: Icons.brightness_auto,
                    isSelected: selectedTheme == AppThemePreference.system,
                    onTap: () {
                      context.read<OnboardingBloc>().add(
                            SelectThemeEvent(AppThemePreference.system),
                          );
                    },
                  ),
                  const Spacer(),
                  // Continue Button
                  OnboardingButton(
                    text: t.continueButton,
                    onPressed: onContinue,
                  ),
                  SizedBox(height: AppSpacing.s24),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
