import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/daily_log.dart';
import '../../domain/repositories/journal_repository.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
    final JournalRepository repository;

    JournalBloc({required this.repository}) : super(JournalInitial()) {
        on<SaveDailyLog>(_onSaveDailyLog);
    }

    Future<void> _onSaveDailyLog(
        SaveDailyLog event,
        Emitter<JournalState> emit,
    ) async {
        emit(JournalLoading());
        try {
            await repository.saveLog(event.log);
            emit(JournalSuccess());
        } catch (e) {
            emit(JournalError("Error al guardar: $e"));
        }
    }
}