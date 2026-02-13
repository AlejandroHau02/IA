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
        on<LoadJournalHistory>(_onLoadJournalHistory);
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

    Future<void> _onLoadJournalHistory(
        LoadJournalHistory event,
        Emitter<JournalState> emit,
    ) async {
        emit(JournalLoading()); // 1- Cargando
        try {
            final logs = await repository.getHistory(); // 2- Pedir datos a la DB
            emit(JournalHistoryLoaded(logs)); // 2- Entregar los datos
        } catch (e) {
            emit(JournalError("Error al cargar historial: $e")); // 4- Algo salió mal
        }
    }
}