import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/daily_log.dart';
import '../../domain/repositories/journal_repository.dart';

class JournalRepositoryImpl implements JournalRepository {
  final AppDatabase _db;

  JournalRepositoryImpl(this._db);

  @override
  Future<void> saveLog(DailyLog log) async {
    final entry = DailyEntriesCompanion(
      id: Value(log.id),
      createdAt: Value(log.date),
      energyLevel: Value(log.energyLevel),
      stressLevel: Value(log.stressLevel),
      noteContent: Value(log.note),
      socialContextJson: Value(jsonEncode(log.context)),
    );

    // Insert or replace ensures we can update today's log repeatedly without duplicates
    await _db.into(_db.dailyEntries).insertOnConflictUpdate(entry);
  }

  @override
  Future<List<DailyLog>> getHistory() async {
    final rows = await _db.select(_db.dailyEntries).get();
    return rows.map((row) => _mapRowToEntity(row)).toList();
  }

  @override
  Future<DailyLog?> getTodayLog() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    // Create a query to find entries between start and end of today
    final query = _db.select(_db.dailyEntries)
      ..where((tbl) => tbl.createdAt.isBetweenValues(startOfDay, endOfDay))
      ..limit(1);

    final row = await query.getSingleOrNull();
    return row != null ? _mapRowToEntity(row) : null;
  }

  DailyLog _mapRowToEntity(DailyEntry row) {
    return DailyLog(
      id: row.id,
      date: row.createdAt,
      energyLevel: row.energyLevel,
      stressLevel: row.stressLevel,
      note: row.noteContent,
      context: row.socialContextJson != null 
          ? jsonDecode(row.socialContextJson!) 
          : {},
    );
  }
}
