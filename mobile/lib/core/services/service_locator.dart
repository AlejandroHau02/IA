import 'package:get_it/get_it.dart';
import '../../features/journal/data/repositories/journal_repository_impl.dart';
import '../../features/journal/domain/repositories/journal_repository.dart';
import '../../features/journal/presentation/bloc/journal_bloc.dart';
import '../database/app_database.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // 1. External (Database, SharedPreferences, etc.)
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // 2. Core Services
  // (Here we will register AnalyticsService, LogService, etc.)

  // 3. Repositories
  getIt.registerLazySingleton<JournalRepository>(
    () => JournalRepositoryImpl(getIt()),
  );

  // 4. BLoCs / Cubits
  // (Here we will register the State Management)
  getIt.registerFactory(() => JournalBloc(repository: getIt()));
}
