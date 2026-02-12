part of 'journal_bloc.dart';

abstract class JournalEvent extends Equatable {
    const JournalEvent();

    @override
    List<Object> get props => [];
}

class SaveDailyLog extends JournalEvent {
    final DailyLog log;

    const SaveDailyLog(this.log);

    @override
    List<Object> get props => [log];
}