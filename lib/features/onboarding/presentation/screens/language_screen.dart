import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../gen/l10n/app_localizations.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_spacing.dart';
import '../../../user/presentation/bloc/user_bloc.dart';
import '../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/selection_card.dart';

/// Language selection screen with immediate language switching.
class LanguageScreen extends StatefulWidget {
  final VoidCallback onContinue;

  const LanguageScreen({
    super.key,
    required this.onContinue,
  });

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Create staggered animations for cards
    _slideAnimations = List.generate(2, (index) {
      final start = index * 0.1;
      final end = start + 0.6;
      return Tween<Offset>(
        begin: const Offset(-0.5, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ));
    });

    _fadeAnimations = List.generate(2, (index) {
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
              final selectedLanguage = state.selectedLanguage ?? 'en';

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
                        Icons.language,
                        size: 40.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.s32),
                  // Title
                  Text(
                    t.selectLanguageTitle,
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
                    t.selectLanguageSubtitle,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.bodyText,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s40),
                  // Language Options with staggered animation
                  SlideTransition(
                    position: _slideAnimations[0],
                    child: FadeTransition(
                      opacity: _fadeAnimations[0],
                      child: SelectionCard(
                        title: t.english,
                        icon: Icons.language,
                        isSelected: selectedLanguage == 'en',
                        onTap: () {
                          // Update OnboardingBloc state
                          context.read<OnboardingBloc>().add(
                                const SelectLanguageEvent('en'),
                              );
                          // Immediately update UserBloc to change app language
                          context.read<UserBloc>().add(
                                const UpdateLanguageEvent('en'),
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
                        title: t.arabic,
                        icon: Icons.language,
                        isSelected: selectedLanguage == 'ar',
                        onTap: () {
                          // Update OnboardingBloc state
                          context.read<OnboardingBloc>().add(
                                const SelectLanguageEvent('ar'),
                              );
                          // Immediately update UserBloc to change app language
                          context.read<UserBloc>().add(
                                const UpdateLanguageEvent('ar'),
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
