import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../gen/l10n/app_localizations.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_spacing.dart';
import '../../../user/presentation/bloc/user_bloc.dart';
import '../widgets/dashboard_app_bar.dart';
import '../widgets/dashboard_welcome_section.dart';
import '../widgets/dashboard_progress_grid.dart';
import 'dart:math' as math;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pageAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _pageAnimationController.forward();
  }

  void _initializeAnimations() {
    _pageAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _pageAnimationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _pageAnimationController,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _pageAnimationController.dispose();
    super.dispose();
  }

  String _getRandomMotivationalQuote(AppLocalizations localizations) {
    final quotes = [
      localizations.motivationalQuote1,
      localizations.motivationalQuote2,
      localizations.motivationalQuote3,
      localizations.motivationalQuote4,
      localizations.motivationalQuote5,
    ];
    return quotes[math.Random().nextInt(quotes.length)];
  }

  void _handleMenuTap() {}

  void _handleNotificationTap() {}

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDarkMode ? AppColors.backgroundDark : AppColors.whiteSoft;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          final userName = null as String?;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAnimatedAppBar(isDarkMode),
                AppSpacing.gap8,
                _buildAnimatedWelcomeSection(
                  localizations,
                  userName,
                  isDarkMode,
                ),
                AppSpacing.gap32,
                _buildAnimatedProgressSection(
                  localizations,
                  isDarkMode,
                ),
                AppSpacing.gap24,
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedAppBar(bool isDarkMode) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: DashboardAppBar(
        isDark: isDarkMode,
        onMenuTap: _handleMenuTap,
        onNotificationTap: _handleNotificationTap,
      ),
    );
  }

  Widget _buildAnimatedWelcomeSection(
    AppLocalizations localizations,
    String? userName,
    bool isDarkMode,
  ) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: DashboardWelcomeSection(
          userName: userName,
          motivationalQuote: _getRandomMotivationalQuote(localizations),
          isDark: isDarkMode,
        ),
      ),
    );
  }

  Widget _buildAnimatedProgressSection(
    AppLocalizations localizations,
    bool isDarkMode,
  ) {
    final titleColor =
        isDarkMode ? AppColors.whiteSoft : AppColors.backgroundDark;

    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _pageAnimationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.05),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _pageAnimationController,
            curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
          ),
        ),
        child: Padding(
          padding: AppSpacing.ph20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations.todayProgress,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: titleColor,
                    ),
              ),
              AppSpacing.gap16,
              DashboardProgressGrid(
                isDark: isDarkMode,
                animationController: _pageAnimationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
