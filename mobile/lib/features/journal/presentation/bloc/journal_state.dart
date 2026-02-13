part of 'journal_bloc.dart';

abstract class JournalState extends Equatable {
    const JournalState();

    @override
    List<Object> get props => [];
}

class JournalInitial extends JournalState {}

class JournalLoading extends JournalState {}

class JournalSuccess extends JournalState {}

class JournalError extends JournalState {
    final String message;
    const JournalError(this.message);

    @override
    List<Object> get props => [message];
}

// Estado que contiene la lista de diarios cargada
class JournalHistoryLoaded extends JournalState {
    final List<DailyLog> logs;

    const JournalHistoryLoaded(this.logs);

    @override
    List<Object> get props => [logs];
}