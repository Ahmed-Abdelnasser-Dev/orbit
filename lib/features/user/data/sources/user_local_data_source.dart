import 'package:sqflite/sqflite.dart';
import '../../../../core/services/database_service.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/entities/preferences.dart';

/// Local data source for user-related data using SQLite.
class UserLocalDataSource {
  final DatabaseService _databaseService;

  UserLocalDataSource(this._databaseService);

  /// Save user profile to database.
  Future<void> saveUserProfile(UserProfile profile) async {
    final db = await _databaseService.database;
    final now = DateTime.now().toIso8601String();

    await db.insert(
      'user_profile',
      {
        'age': profile.age,
        'weight_kg': profile.weightKg,
        'height_cm': profile.heightCm,
        'wake_up': profile.wakeSleep.wakeUp,
        'sleep': profile.wakeSleep.sleep,
        'created_at': now,
        'updated_at': now,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Get user profile from database.
  Future<UserProfile?> getUserProfile() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'user_profile',
      orderBy: 'id DESC',
      limit: 1,
    );

    if (maps.isEmpty) return null;

    final map = maps.first;
    return UserProfile(
      age: map['age'] as int,
      weightKg: map['weight_kg'] as double,
      heightCm: map['height_cm'] as double,
      wakeSleep: TimeOfDayWakeSleep(
        wakeUp: map['wake_up'] as String,
        sleep: map['sleep'] as String,
      ),
    );
  }

  /// Update user profile in database.
  Future<void> updateUserProfile(UserProfile profile) async {
    final db = await _databaseService.database;
    final now = DateTime.now().toIso8601String();

    await db.update(
      'user_profile',
      {
        'age': profile.age,
        'weight_kg': profile.weightKg,
        'height_cm': profile.heightCm,
        'wake_up': profile.wakeSleep.wakeUp,
        'sleep': profile.wakeSleep.sleep,
        'updated_at': now,
      },
      where: 'id = (SELECT MAX(id) FROM user_profile)',
    );
  }

  /// Delete user profile from database.
  Future<void> deleteUserProfile() async {
    final db = await _databaseService.database;
    await db.delete('user_profile');
  }

  /// Save user preferences to database.
  Future<void> savePreferences(Preferences preferences) async {
    final db = await _databaseService.database;
    final now = DateTime.now().toIso8601String();

    await db.insert(
      'preferences',
      {
        'language_code': preferences.languageCode,
        'theme': preferences.theme.name,
        'notifications_allowed': preferences.notificationsAllowed ? 1 : 0,
        'created_at': now,
        'updated_at': now,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Get user preferences from database.
  Future<Preferences?> getPreferences() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'preferences',
      orderBy: 'id DESC',
      limit: 1,
    );

    if (maps.isEmpty) return null;

    final map = maps.first;
    return Preferences(
      languageCode: map['language_code'] as String,
      theme: AppThemePreference.values.firstWhere(
        (e) => e.name == map['theme'],
        orElse: () => AppThemePreference.system,
      ),
      notificationsAllowed: (map['notifications_allowed'] as int) == 1,
    );
  }

  /// Update user preferences in database.
  Future<void> updatePreferences(Preferences preferences) async {
    final db = await _databaseService.database;
    final now = DateTime.now().toIso8601String();

    await db.update(
      'preferences',
      {
        'language_code': preferences.languageCode,
        'theme': preferences.theme.name,
        'notifications_allowed': preferences.notificationsAllowed ? 1 : 0,
        'updated_at': now,
      },
      where: 'id = (SELECT MAX(id) FROM preferences)',
    );
  }

  /// Check if user setup is complete.
  Future<bool> hasCompletedSetup() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'onboarding_status',
      where: 'completed = ?',
      whereArgs: [1],
      limit: 1,
    );

    return maps.isNotEmpty;
  }

  /// Mark user setup as complete.
  Future<void> markSetupComplete() async {
    final db = await _databaseService.database;
    final now = DateTime.now().toIso8601String();

    await db.insert(
      'onboarding_status',
      {
        'completed': 1,
        'completed_at': now,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
