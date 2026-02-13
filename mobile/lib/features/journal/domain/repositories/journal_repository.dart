import '../entities/daily_log.dart';

abstract class JournalRepository {
  /// Save a daily log entry into the local database
  Future<void> saveLog(DailyLog log);

  /// Retrieve all logs for history analysis
  Future<List<DailyLog>> getHistory();

  /// Get today's log if it exists
  Future<DailyLog?> getTodayLog();

  // Delete a log entry
  Future<void> deleteLog(String id);
}
