import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Central database service managing SQLite database lifecycle.
class DatabaseService {
  static Database? _database;
  static const String _databaseName = 'orbit.db';
  static const int _databaseVersion = 1;

  /// Get or initialize the database instance.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initialize the database with schema and migrations.
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// Create initial database schema.
  Future<void> _onCreate(Database db, int version) async {
    // User profile table
    await db.execute('''
      CREATE TABLE user_profile (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        age INTEGER NOT NULL,
        weight_kg REAL NOT NULL,
        height_cm REAL NOT NULL,
        wake_up TEXT NOT NULL,
        sleep TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Preferences table
    await db.execute('''
      CREATE TABLE preferences (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        language_code TEXT NOT NULL,
        theme TEXT NOT NULL,
        notifications_allowed INTEGER NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Onboarding status table
    await db.execute('''
      CREATE TABLE onboarding_status (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        completed INTEGER NOT NULL DEFAULT 0,
        completed_at TEXT
      )
    ''');
  }

  /// Handle database migrations.
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Add migration logic here when schema changes
  }

  /// Close the database connection.
  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
