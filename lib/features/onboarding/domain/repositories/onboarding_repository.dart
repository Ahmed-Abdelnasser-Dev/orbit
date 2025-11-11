import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

/// Repository interface for onboarding flow operations.
abstract class OnboardingRepository {
  Future<Either<Failure, void>> completeOnboarding();
  Future<Either<Failure, bool>> isOnboardingCompleted();
}
