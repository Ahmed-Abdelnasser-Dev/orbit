import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/entities/preferences.dart';
import '../../domain/repositories/user_repository.dart';
import '../sources/user_local_data_source.dart';

/// Implementation of UserRepository using local data source.
class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _localDataSource;

  UserRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, void>> saveUserProfile(UserProfile profile) async {
    try {
      await _localDataSource.saveUserProfile(profile);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserProfile?>> getUserProfile() async {
    try {
      final profile = await _localDataSource.getUserProfile();
      return Right(profile);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserProfile(UserProfile profile) async {
    try {
      await _localDataSource.updateUserProfile(profile);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUserProfile() async {
    try {
      await _localDataSource.deleteUserProfile();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> savePreferences(Preferences preferences) async {
    try {
      await _localDataSource.savePreferences(preferences);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Preferences?>> getPreferences() async {
    try {
      final preferences = await _localDataSource.getPreferences();
      return Right(preferences);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePreferences(
      Preferences preferences) async {
    try {
      await _localDataSource.updatePreferences(preferences);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> hasCompletedSetup() async {
    try {
      final completed = await _localDataSource.hasCompletedSetup();
      return Right(completed);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markSetupComplete() async {
    try {
      await _localDataSource.markSetupComplete();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
