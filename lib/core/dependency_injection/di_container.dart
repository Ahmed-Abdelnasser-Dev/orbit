import 'package:get_it/get_it.dart';
import 'package:orbit/core/router/app_router.dart';
import 'package:orbit/core/services/database_service.dart';
import 'package:orbit/core/services/notification_service.dart';
import 'package:orbit/core/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:orbit/features/user/data/sources/user_local_data_source.dart';
import 'package:orbit/features/user/data/repositories/user_repository_impl.dart';
import 'package:orbit/features/user/domain/repositories/user_repository.dart';
import 'package:orbit/features/user/presentation/bloc/user_bloc.dart';
import 'package:orbit/features/onboarding/data/sources/onboarding_local_data_source.dart';
import 'package:orbit/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:orbit/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:orbit/features/onboarding/presentation/bloc/onboarding_bloc.dart';

final GetIt di = GetIt.instance;

Future<void> configureDependencies() async {
  // Core services - Initialize database first
  final databaseService = DatabaseService();
  await databaseService.database; // Ensure database is initialized
  di.registerLazySingleton<DatabaseService>(() => databaseService);

  di.registerLazySingleton<NotificationService>(() => NotificationService());

  // Router
  di.registerLazySingleton<AppRouter>(() => AppRouter());

  // Navigation
  di.registerFactory<NavigationBloc>(() => NavigationBloc());

  // User feature
  di.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSource(di()),
  );
  di.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(di()),
  );
  di.registerFactory<UserBloc>(
    () => UserBloc(repository: di()),
  );

  // Onboarding feature
  di.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSource(di()),
  );
  di.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(di()),
  );
  di.registerFactory<OnboardingBloc>(
    () => OnboardingBloc(
      onboardingRepository: di(),
      userRepository: di(),
      notificationService: di(),
    ),
  );
}
