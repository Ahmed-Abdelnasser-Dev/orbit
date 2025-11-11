import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/dependency_injection/di_container.dart';
import '../bloc/onboarding_bloc.dart';
import '../widgets/step_indicator.dart';
import 'welcome_screen.dart';
import 'language_screen.dart';
import 'theme_screen.dart';
import 'user_data_screen.dart';
import 'permissions_screen.dart';
import 'auth_screen.dart';

/// Main onboarding flow screen with PageView.
class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 6; // Total number of onboarding steps
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late OnboardingBloc _onboardingBloc;

  @override
  void initState() {
    super.initState();

    // Initialize bloc
    _onboardingBloc = di<OnboardingBloc>();

    // Setup animation controller for page transitions
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start initial animation
    _animationController.forward();

    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
        // Restart animation on page change
        _animationController.reset();
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    _onboardingBloc.close();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
      _onboardingBloc.add(const GoToNextStepEvent());
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
      _onboardingBloc.add(const GoToPreviousStepEvent());
    }
  }

  Future<void> _completeOnboarding() async {
    // Animate out before completing
    await _animationController.reverse();

    if (mounted) {
      _onboardingBloc.add(const CompleteOnboardingEvent());
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _onboardingBloc,
      child: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.status == OnboardingStatus.completed) {
            context.go('/');
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: _currentPage > 0
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _goToPreviousPage,
                  )
                : null,
            title: StepIndicator(
              currentStep: _currentPage,
              totalSteps: _totalPages,
            ),
            centerTitle: true,
          ),
          body: AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.1, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeOutCubic,
                  )),
                  child: child,
                ),
              );
            },
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(), // Disable swipe
              children: [
                // Step 1: Welcome
                WelcomeScreen(
                  onContinue: _goToNextPage,
                ),
                // Step 2: Language Selection
                LanguageScreen(
                  onContinue: _goToNextPage,
                ),
                // Step 3: Theme Selection
                ThemeScreen(
                  onContinue: _goToNextPage,
                ),
                // Step 4: User Data Collection
                UserDataScreen(
                  onContinue: _goToNextPage,
                ),
                // Step 5: Permissions Request
                PermissionsScreen(
                  onContinue: _goToNextPage,
                  onSkip: _goToNextPage,
                ),
                // Step 6: Authentication (optional)
                AuthScreen(
                  onContinue: _completeOnboarding,
                  onSkip: _completeOnboarding,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
