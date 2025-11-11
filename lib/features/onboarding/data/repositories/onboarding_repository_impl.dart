import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../sources/onboarding_local_data_source.dart';

/// Implementation of onboarding repository using local data source.
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource _localDataSource;

  OnboardingRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, void>> completeOnboarding() async {
    try {
      await _localDataSource.setOnboardingCompleted();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    try {
      final completed = await _localDataSource.isOnboardingCompleted();
      return Right(completed);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
