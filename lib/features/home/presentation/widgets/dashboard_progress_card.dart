import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_spacing.dart';

class DashboardProgressCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final double progress;
  final String subtitle;
  final Color color;
  final bool isDark;

  const DashboardProgressCard({
    super.key,
    required this.icon,
    required this.title,
    required this.progress,
    required this.subtitle,
    required this.color,
    required this.isDark,
  });

  @override
  State<DashboardProgressCard> createState() => _DashboardProgressCardState();
}

class _DashboardProgressCardState extends State<DashboardProgressCard>
    with TickerProviderStateMixin {
  late AnimationController _tapScaleController;
  late AnimationController _progressBarController;
  late Animation<double> _tapScaleAnimation;
  late Animation<double> _progressBarAnimation;

  @override
  void initState() {
    super.initState();

    _tapScaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _progressBarController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _tapScaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _tapScaleController, curve: Curves.easeInOut),
    );

    _progressBarAnimation = Tween<double>(
      begin: 0.0,
      end: widget.progress,
    ).animate(
      CurvedAnimation(
        parent: _progressBarController,
        curve: Curves.easeOutCubic,
      ),
    );

    _progressBarController.forward();
  }

  @override
  void dispose() {
    _tapScaleController.dispose();
    _progressBarController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _tapScaleController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _tapScaleController.reverse();
  }

  void _handleTapCancel() {
    _tapScaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final cardBackgroundColor = widget.isDark
        ? AppColors.backgroundDark.withOpacity(0.5)
        : AppColors.whiteSoft;

    final cardBorderColor = widget.isDark
        ? AppColors.bodyText.withOpacity(0.1)
        : AppColors.bodyText.withOpacity(0.08);

    final titleColor = widget.isDark
        ? AppColors.whiteSoft.withOpacity(0.9)
        : AppColors.backgroundDark.withOpacity(0.9);

    final progressBackgroundColor = widget.isDark
        ? AppColors.bodyText.withOpacity(0.1)
        : AppColors.bodyText.withOpacity(0.08);

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: ScaleTransition(
        scale: _tapScaleAnimation,
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: cardBackgroundColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: cardBorderColor,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIconBadge(),
              AppSpacing.gap12,
              _buildTitle(titleColor),
              AppSpacing.gap8,
              _buildProgressBar(progressBackgroundColor),
              AppSpacing.gap8,
              _buildSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconBadge() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.elasticOut,
      builder: (context, scaleValue, child) {
        return Transform.scale(
          scale: scaleValue,
          child: Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: widget.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              widget.icon,
              color: widget.color,
              size: 24.sp,
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle(Color titleColor) {
    return Text(
      widget.title,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: titleColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProgressBar(Color backgroundColor) {
    return AnimatedBuilder(
      animation: _progressBarAnimation,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LinearProgressIndicator(
            value: _progressBarAnimation.value,
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(widget.color),
            minHeight: 6.h,
          ),
        );
      },
    );
  }

  Widget _buildSubtitle() {
    return Text(
      widget.subtitle,
      style: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.bodyText.withOpacity(0.7),
      ),
    );
  }
}
