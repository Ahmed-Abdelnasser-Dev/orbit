import 'package:flutter/material.dart';
import '../../../../gen/l10n/app_localizations.dart';
import '../../../../core/styles/app_spacing.dart';
import 'dashboard_progress_card.dart';

class DashboardProgressGrid extends StatelessWidget {
  final bool isDark;
  final AnimationController animationController;

  const DashboardProgressGrid({
    super.key,
    required this.isDark,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      children: [
        _buildTopRow(localizations),
        AppSpacing.gap16,
        _buildBottomRow(localizations),
      ],
    );
  }

  Widget _buildTopRow(AppLocalizations localizations) {
    return Row(
      children: [
        Expanded(
          child: _AnimatedProgressCard(
            delay: 0.4,
            animationController: animationController,
            child: DashboardProgressCard(
              icon: Icons.work_outline_rounded,
              title: localizations.workProgress,
              progress: 0.65,
              subtitle: localizations.tasksCompleted(4, 6),
              color: const Color(0xFF6366F1),
              isDark: isDark,
            ),
          ),
        ),
        AppSpacing.hgap16,
        Expanded(
          child: _AnimatedProgressCard(
            delay: 0.5,
            animationController: animationController,
            child: DashboardProgressCard(
              icon: Icons.favorite_outline_rounded,
              title: localizations.healthProgress,
              progress: 0.45,
              subtitle: localizations.minutesActive(27),
              color: const Color(0xFFEC4899),
              isDark: isDark,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomRow(AppLocalizations localizations) {
    return Row(
      children: [
        Expanded(
          child: _AnimatedProgressCard(
            delay: 0.6,
            animationController: animationController,
            child: DashboardProgressCard(
              icon: Icons.self_improvement_rounded,
              title: localizations.mentalProgress,
              progress: 0.33,
              subtitle: localizations.sessionsCompleted(1),
              color: const Color(0xFF8B5CF6),
              isDark: isDark,
            ),
          ),
        ),
        AppSpacing.hgap16,
        Expanded(
          child: _AnimatedProgressCard(
            delay: 0.7,
            animationController: animationController,
            child: DashboardProgressCard(
              icon: Icons.palette_outlined,
              title: localizations.hobbiesProgress,
              progress: 0.80,
              subtitle: localizations.hoursSpent(2),
              color: const Color(0xFF10B981),
              isDark: isDark,
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimatedProgressCard extends StatelessWidget {
  final double delay;
  final AnimationController animationController;
  final Widget child;

  const _AnimatedProgressCard({
    required this.delay,
    required this.animationController,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final staggeredAnimation = CurvedAnimation(
      parent: animationController,
      curve: Interval(delay, 1.0, curve: Curves.easeOutCubic),
    );

    return FadeTransition(
      opacity: staggeredAnimation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(staggeredAnimation),
        child: child,
      ),
    );
  }
}
