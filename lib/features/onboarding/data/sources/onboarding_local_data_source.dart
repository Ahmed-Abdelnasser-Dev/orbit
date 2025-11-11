import 'package:sqflite/sqflite.dart';
import '../../../../core/services/database_service.dart';

/// Local data source for onboarding status.
class OnboardingLocalDataSource {
  final DatabaseService _databaseService;

  OnboardingLocalDataSource(this._databaseService);

  /// Mark onboarding as completed.
  Future<void> setOnboardingCompleted() async {
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

  /// Check if onboarding is completed.
  Future<bool> isOnboardingCompleted() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'onboarding_status',
      where: 'completed = ?',
      whereArgs: [1],
      limit: 1,
    );

    return maps.isNotEmpty;
  }
}
