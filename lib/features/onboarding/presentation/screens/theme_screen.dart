import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../gen/l10n/app_localizations.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_spacing.dart';
import '../../../user/domain/entities/preferences.dart';
import '../../../user/presentation/bloc/user_bloc.dart';
import '../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/selection_card.dart';

/// Theme selection screen.
class ThemeScreen extends StatefulWidget {
  final VoidCallback onContinue;

  const ThemeScreen({
    super.key,
    required this.onContinue,
  });

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    // Create staggered animations for 3 theme cards
    _slideAnimations = List.generate(3, (index) {
      final start = index * 0.1;
      final end = start + 0.6;
      return Tween<Offset>(
        begin: const Offset(0.5, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ));
    });

    _fadeAnimations = List.generate(3, (index) {
      final start = index * 0.1;
      final end = start + 0.6;
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeIn),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              final selectedTheme =
                  state.selectedTheme ?? AppThemePreference.system;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.s32),
                  // Icon
                  Center(
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Icon(
                        Icons.palette_outlined,
                        size: 40.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.s32),
                  // Title
                  Text(
                    t.selectThemeTitle,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.whiteSoft
                          : AppColors.backgroundDark,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s12),
                  Text(
                    t.selectThemeSubtitle,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.bodyText,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s40),
                  // Theme Options with staggered animation
                  SlideTransition(
                    position: _slideAnimations[0],
                    child: FadeTransition(
                      opacity: _fadeAnimations[0],
                      child: SelectionCard(
                        title: t.lightMode,
                        icon: Icons.light_mode,
                        isSelected: selectedTheme == AppThemePreference.light,
                        onTap: () {
                          // Update OnboardingBloc state
                          context.read<OnboardingBloc>().add(
                                SelectThemeEvent(AppThemePreference.light),
                              );
                          // Immediately update UserBloc to change app theme
                          context.read<UserBloc>().add(
                                UpdateThemeEvent(AppThemePreference.light),
                              );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.s16),
                  SlideTransition(
                    position: _slideAnimations[1],
                    child: FadeTransition(
                      opacity: _fadeAnimations[1],
                      child: SelectionCard(
                        title: t.darkMode,
                        icon: Icons.dark_mode,
                        isSelected: selectedTheme == AppThemePreference.dark,
                        onTap: () {
                          // Update OnboardingBloc state
                          context.read<OnboardingBloc>().add(
                                SelectThemeEvent(AppThemePreference.dark),
                              );
                          // Immediately update UserBloc to change app theme
                          context.read<UserBloc>().add(
                                UpdateThemeEvent(AppThemePreference.dark),
                              );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.s16),
                  SlideTransition(
                    position: _slideAnimations[2],
                    child: FadeTransition(
                      opacity: _fadeAnimations[2],
                      child: SelectionCard(
                        title: t.systemMode,
                        icon: Icons.brightness_auto,
                        isSelected: selectedTheme == AppThemePreference.system,
                        onTap: () {
                          // Update OnboardingBloc state
                          context.read<OnboardingBloc>().add(
                                SelectThemeEvent(AppThemePreference.system),
                              );
                          // Immediately update UserBloc to change app theme
                          context.read<UserBloc>().add(
                                UpdateThemeEvent(AppThemePreference.system),
                              );
                        },
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Continue Button
                  OnboardingButton(
                    text: t.continueButton,
                    onPressed: widget.onContinue,
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
