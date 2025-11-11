import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles/app_colors.dart';
import '../../../styles/app_spacing.dart';
import '../../../../gen/l10n/app_localizations.dart';
import '../bloc/navigation_bloc.dart';

/// Navigation item data model.
class NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String labelKey;

  const NavItem({
    required this.icon,
    required this.activeIcon,
    required this.labelKey,
  });
}

class BottomNavBar extends StatelessWidget {
  final Function(int) onTabChanged;

  const BottomNavBar({
    super.key,
    required this.onTabChanged,
  });

  /// Define navigation items.
  static List<NavItem> _getNavItems() {
    return const [
      NavItem(
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard_rounded,
        labelKey: 'dashboard',
      ),
      NavItem(
        icon: Icons.work_outline_rounded,
        activeIcon: Icons.work_rounded,
        labelKey: 'work',
      ),
      NavItem(
        icon: Icons.favorite_outline_rounded,
        activeIcon: Icons.favorite_rounded,
        labelKey: 'health',
      ),
      NavItem(
        icon: Icons.psychology_outlined,
        activeIcon: Icons.psychology_rounded,
        labelKey: 'mental',
      ),
      NavItem(
        icon: Icons.sports_esports_outlined,
        activeIcon: Icons.sports_esports_rounded,
        labelKey: 'hobbies',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final navItems = _getNavItems();
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Container(
          height: 70.h + bottomPadding,
          decoration: BoxDecoration(
            color: isDark ? AppColors.backgroundDark : AppColors.whiteSoft,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
            border: Border(
              top: BorderSide(
                color: isDark
                    ? AppColors.primary.withOpacity(0.15)
                    : AppColors.primary.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                navItems.length,
                (index) => _NavBarItem(
                  item: navItems[index],
                  label: _getLabel(t, navItems[index].labelKey),
                  isSelected: state.selectedIndex == index,
                  onTap: () => onTabChanged(index),
                  isDark: isDark,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Get localized label for nav item.
  String _getLabel(AppLocalizations t, String key) {
    switch (key) {
      case 'dashboard':
        return t.dashboard;
      case 'work':
        return t.work;
      case 'health':
        return t.health;
      case 'mental':
        return t.mental;
      case 'hobbies':
        return t.hobbies;
      default:
        return key;
    }
  }
}

/// Individual navigation bar item.
class _NavBarItem extends StatefulWidget {
  final NavItem item;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  const _NavBarItem({
    required this.item,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _iconAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.isSelected) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(_NavBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onTap,
        splashColor: AppColors.primary.withOpacity(0.1),
        highlightColor: AppColors.primary.withOpacity(0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: AnimatedBuilder(
                animation: _iconAnimation,
                builder: (context, child) {
                  return Icon(
                    _iconAnimation.value > 0.5
                        ? widget.item.activeIcon
                        : widget.item.icon,
                    size: 26.sp,
                    color: Color.lerp(
                      widget.isDark
                          ? AppColors.bodyText
                          : AppColors.bodyText.withOpacity(0.6),
                      AppColors.primary,
                      _iconAnimation.value,
                    ),
                  );
                },
              ),
            ),
            AppSpacing.gap4,
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: widget.isSelected ? 11.sp : 10.sp,
                fontWeight:
                    widget.isSelected ? FontWeight.w700 : FontWeight.w600,
                color: widget.isSelected
                    ? AppColors.primary
                    : (widget.isDark
                        ? AppColors.bodyText
                        : AppColors.bodyText.withOpacity(0.6)),
              ),
              child: Text(
                widget.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
