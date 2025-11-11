import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/l10n/app_localizations.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_spacing.dart';

class DashboardWelcomeSection extends StatefulWidget {
  final String? userName;
  final String motivationalQuote;
  final bool isDark;

  const DashboardWelcomeSection({
    super.key,
    required this.userName,
    required this.motivationalQuote,
    required this.isDark,
  });

  @override
  State<DashboardWelcomeSection> createState() =>
      _DashboardWelcomeSectionState();
}

class _DashboardWelcomeSectionState extends State<DashboardWelcomeSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseAnimationController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initializePulseAnimation();
  }

  void _initializePulseAnimation() {
    _pulseAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _pulseAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _pulseAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final containerBackgroundColor = widget.isDark
        ? AppColors.backgroundDark.withOpacity(0.6)
        : AppColors.whiteSoft.withOpacity(0.8);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 24.h,
        left: 20.w,
        right: 20.w,
        bottom: 40.h,
      ),
      decoration: BoxDecoration(
        color: containerBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAnimatedEmoji(),
          AppSpacing.gap20,
          _buildWelcomeMessage(localizations),
          AppSpacing.gap16,
          _buildMotivationalQuote(),
        ],
      ),
    );
  }

  Widget _buildAnimatedEmoji() {
    final emojiBackgroundColor = widget.isDark
        ? AppColors.primary.withOpacity(0.1)
        : AppColors.primary.withOpacity(0.08);

    return ScaleTransition(
      scale: _pulseAnimation,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: emojiBackgroundColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          '👋',
          style: TextStyle(fontSize: 32.sp),
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage(AppLocalizations localizations) {
    final welcomeText = (widget.userName?.isNotEmpty ?? false)
        ? localizations.welcomeBackUser(widget.userName!)
        : localizations.welcomeBackWarrior;

    final textColor =
        widget.isDark ? AppColors.whiteSoft : AppColors.backgroundDark;

    return Text(
      welcomeText,
      style: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w800,
        color: textColor,
        height: 1.2,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildMotivationalQuote() {
    final quoteTextColor = widget.isDark
        ? AppColors.bodyText.withOpacity(0.95)
        : AppColors.bodyText;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAccentBar(),
        AppSpacing.hgap12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.primary.withOpacity(0.7),
                size: 16.sp,
              ),
              AppSpacing.gap4,
              Text(
                widget.motivationalQuote,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: quoteTextColor,
                  height: 1.5,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccentBar() {
    return Container(
      width: 4.w,
      height: 48.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}
