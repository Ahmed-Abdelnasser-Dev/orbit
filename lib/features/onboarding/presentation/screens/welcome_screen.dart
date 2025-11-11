import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../gen/l10n/app_localizations.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_spacing.dart';
import '../widgets/onboarding_button.dart';

/// Welcome screen - First step of onboarding.
class WelcomeScreen extends StatefulWidget {
  final VoidCallback onContinue;

  const WelcomeScreen({
    super.key,
    required this.onContinue,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _rotationAnimation = Tween<double>(begin: -0.2, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

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
          child: Column(
            children: [
              const Spacer(),
              // App Icon/Logo with animation
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: child,
                    ),
                  );
                },
                child: Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.rocket_launch_rounded,
                    size: 64.sp,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.s32),
              // Title
              Text(
                t.onboardingWelcomeTitle,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w800,
                  color:
                      isDark ? AppColors.whiteSoft : AppColors.backgroundDark,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.s16),
              // Subtitle
              Text(
                t.onboardingWelcomeSubtitle,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.bodyText,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Continue Button
              OnboardingButton(
                text: t.getStarted,
                onPressed: widget.onContinue,
              ),
              SizedBox(height: AppSpacing.s24),
            ],
          ),
        ),
      ),
    );
  }
}
