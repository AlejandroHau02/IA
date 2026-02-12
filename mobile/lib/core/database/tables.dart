import 'package:drift/drift.dart';

// Tabla principal para el entrenamiento de la futura IA
// Diseñada para ser convertida fácilmente a Tensores
class DailyEntries extends Table {
  // UUID único
  TextColumn get id => text()();
  
  // Timestamp crucial para series temporales
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  // --- INPUT VECTORS (Features) ---
  
  // Nivel de Energía (1-10) -> Normalizable a 0.0-1.0
  IntColumn get energyLevel => integer()();
  
  // Nivel de Estrés (1-10) -> Normalizable a 0.0-1.0
  IntColumn get stressLevel => integer()();
  
  // Contexto rico (JSON) para features auxiliares
  // Ej: {"weather": "rainy", "sleep_hours": 6.5, "location": "office"}
  TextColumn get socialContextJson => text().nullable()();
  
  // Texto libre (Raw Text) para NLP futuro
  TextColumn get noteContent => text().nullable()();
  
  // --- OUTPUT / TARGETS (Labels) ---
  
  // Sentimiento calculado (Pre-computado)
  RealColumn get sentimentScore => real().nullable()();
  
  // Tags generados o manuales
  TextColumn get tags => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Tabla para el Feedback Loop (Reinforcement Learning)
class ActionFeedbacks extends Table {
  TextColumn get id => text()();
  TextColumn get entryId => text().references(DailyEntries, #id)();
  
  // Qué acción se recomendó
  TextColumn get actionType => text()(); // e.g., "breathing_478"
  
  // ¿El usuario la hizo? (Binary Cross-entropy target)
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  
  // Impacto percibido (1-5) (Regression target)
  IntColumn get userRating => integer().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
