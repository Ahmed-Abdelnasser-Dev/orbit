import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../gen/l10n/app_localizations.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_spacing.dart';
import '../widgets/onboarding_button.dart';

/// Auth screen - Login/Signup placeholder.
class AuthScreen extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onSkip;

  const AuthScreen({
    super.key,
    required this.onContinue,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.s32),
              // Title
              Text(
                t.authTitle,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color:
                      isDark ? AppColors.whiteSoft : AppColors.backgroundDark,
                ),
              ),
              SizedBox(height: AppSpacing.s8),
              Text(
                t.authSubtitle,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.bodyText,
                ),
              ),
              const Spacer(),
              // Auth Illustration
              Center(
                child: Icon(
                  Icons.person_outline_rounded,
                  size: 120.sp,
                  // ignore: deprecated_member_use
                  color: AppColors.primary.withOpacity(0.3),
                ),
              ),
              const Spacer(),
              // Sign Up Button
              OnboardingButton(
                text: t.signUpButton,
                onPressed: onContinue, // TODO: Navigate to actual signup
              ),
              SizedBox(height: AppSpacing.s16),
              // Login Button
              OnboardingButton(
                text: t.loginButton,
                onPressed: onContinue, // TODO: Navigate to actual login
                isOutlined: true,
              ),
              SizedBox(height: AppSpacing.s16),
              // Skip Button
              Center(
                child: TextButton(
                  onPressed: onSkip,
                  child: Text(
                    t.skipForNow,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.bodyText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.s8),
            ],
          ),
        ),
      ),
    );
  }
}
