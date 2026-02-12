import 'package:equatable/equatable.dart';

class DailyLog extends Equatable {
  final String id;
  final DateTime date;
  final int energyLevel; // 1-10
  final int stressLevel; // 1-10
  final String? note;
  final Map<String, dynamic> context; // Extra data for AI context

  const DailyLog({
    required this.id,
    required this.date,
    required this.energyLevel,
    required this.stressLevel,
    this.note,
    this.context = const {},
  });

  @override
  List<Object?> get props => [id, date, energyLevel, stressLevel, note, context];
}
