import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../gen/l10n/app_localizations.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_spacing.dart';
import '../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_button.dart';

/// Permissions screen - Request notification permissions.
class PermissionsScreen extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onSkip;

  const PermissionsScreen({
    super.key,
    required this.onContinue,
    required this.onSkip,
  });

  void _requestPermissions(BuildContext context) {
    context.read<OnboardingBloc>().add(const RequestPermissionsEvent());
    // Wait a bit for permission dialog, then continue
    Future.delayed(const Duration(milliseconds: 500), onContinue);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.s32),
              // Title
              Text(
                t.permissionsTitle,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color:
                      isDark ? AppColors.whiteSoft : AppColors.backgroundDark,
                ),
              ),
              SizedBox(height: AppSpacing.s8),
              Text(
                t.permissionsSubtitle,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.bodyText,
                ),
              ),
              SizedBox(height: AppSpacing.s32),
              // Illustration
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Notification Icon
                      Container(
                        width: 120.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.notifications_active_outlined,
                          size: 64.sp,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: AppSpacing.s32),
                      // Description
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppSpacing.s24),
                        child: Text(
                          t.permissionsDescription,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.bodyText,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Allow Button
              OnboardingButton(
                text: t.allowNotifications,
                onPressed: () => _requestPermissions(context),
              ),
              SizedBox(height: AppSpacing.s16),
              // Skip Button
              Center(
                child: TextButton(
                  onPressed: onSkip,
                  child: Text(
                    t.notNow,
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
