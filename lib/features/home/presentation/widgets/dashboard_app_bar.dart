import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/l10n/app_localizations.dart';
import '../../../../core/styles/app_colors.dart';

class DashboardAppBar extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onNotificationTap;
  final bool isDark;

  const DashboardAppBar({
    super.key,
    required this.onMenuTap,
    required this.onNotificationTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final appNameColor =
        isDark ? AppColors.whiteSoft : AppColors.backgroundDark;

    return Container(
      padding: EdgeInsets.only(
        top: 8.h,
        left: 20.w,
        right: 20.w,
        bottom: 8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _AppBarButton(
            icon: Icons.menu_rounded,
            onTap: onMenuTap,
            isDark: isDark,
          ),
          Text(
            localizations.appTitle,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: appNameColor,
              letterSpacing: -0.5,
            ),
          ),
          _AppBarButton(
            icon: Icons.notifications_outlined,
            onTap: onNotificationTap,
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isDark;

  const _AppBarButton({
    required this.icon,
    required this.onTap,
    required this.isDark,
  });

  @override
  State<_AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<_AppBarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _tapScaleController;
  late Animation<double> _tapScaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeTapAnimation();
  }

  void _initializeTapAnimation() {
    _tapScaleController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _tapScaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _tapScaleController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _tapScaleController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _tapScaleController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _tapScaleController.reverse();
    widget.onTap();
  }

  void _handleTapCancel() {
    _tapScaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final buttonBackgroundColor = widget.isDark
        ? AppColors.whiteSoft.withOpacity(0.05)
        : AppColors.backgroundDark.withOpacity(0.05);

    final iconColor =
        widget.isDark ? AppColors.whiteSoft : AppColors.backgroundDark;

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: ScaleTransition(
        scale: _tapScaleAnimation,
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: buttonBackgroundColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            widget.icon,
            color: iconColor,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
