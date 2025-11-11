import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_flow_screen.dart';
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../dependency_injection/di_container.dart';

class AppRouter {
  AppRouter()
      : _router = GoRouter(
          initialLocation: '/',
          redirect: (context, state) async {
            // Check if onboarding is completed
            final onboardingRepo = di<OnboardingRepository>();
            final result = await onboardingRepo.isOnboardingCompleted();

            final isCompleted = result.fold(
              (failure) => false, // On error, assume not completed
              (completed) => completed,
            );

            // If not completed and not already on onboarding, redirect
            if (!isCompleted && state.matchedLocation != '/onboarding') {
              return '/onboarding';
            }

            // If completed and on onboarding, redirect to home
            if (isCompleted && state.matchedLocation == '/onboarding') {
              return '/';
            }

            return null; // No redirect needed
          },
          routes: <GoRoute>[
            GoRoute(
              path: '/',
              name: 'home',
              pageBuilder: (context, state) => const MaterialPage(
                child: HomeScreen(),
              ),
            ),
            GoRoute(
              path: '/onboarding',
              name: 'onboarding',
              pageBuilder: (context, state) => const MaterialPage(
                child: OnboardingFlowScreen(),
              ),
            ),
          ],
        );

  final GoRouter _router;

  GoRouter get router => _router;
}
