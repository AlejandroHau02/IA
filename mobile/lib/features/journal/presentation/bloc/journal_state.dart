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