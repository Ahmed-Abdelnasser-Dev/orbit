import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_profile.dart';
import '../entities/preferences.dart';

/// Repository interface for user-related operations.
/// Manages user profile, preferences, and account information.
abstract class UserRepository {
  /// Save or update user profile.
  Future<Either<Failure, void>> saveUserProfile(UserProfile profile);

  /// Retrieve current user profile.
  Future<Either<Failure, UserProfile?>> getUserProfile();

  /// Update user profile fields.
  Future<Either<Failure, void>> updateUserProfile(UserProfile profile);

  /// Delete user profile.
  Future<Either<Failure, void>> deleteUserProfile();

  /// Save user preferences (theme, language, notifications).
  Future<Either<Failure, void>> savePreferences(Preferences preferences);

  /// Retrieve user preferences.
  Future<Either<Failure, Preferences?>> getPreferences();

  /// Update specific preference.
  Future<Either<Failure, void>> updatePreferences(Preferences preferences);

  /// Check if user has completed initial setup.
  Future<Either<Failure, bool>> hasCompletedSetup();

  /// Mark user setup as complete.
  Future<Either<Failure, void>> markSetupComplete();
}
