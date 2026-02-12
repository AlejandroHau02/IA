// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DailyEntriesTable extends DailyEntries
    with TableInfo<$DailyEntriesTable, DailyEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _energyLevelMeta = const VerificationMeta(
    'energyLevel',
  );
  @override
  late final GeneratedColumn<int> energyLevel = GeneratedColumn<int>(
    'energy_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stressLevelMeta = const VerificationMeta(
    'stressLevel',
  );
  @override
  late final GeneratedColumn<int> stressLevel = GeneratedColumn<int>(
    'stress_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _socialContextJsonMeta = const VerificationMeta(
    'socialContextJson',
  );
  @override
  late final GeneratedColumn<String> socialContextJson =
      GeneratedColumn<String>(
        'social_context_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _noteContentMeta = const VerificationMeta(
    'noteContent',
  );
  @override
  late final GeneratedColumn<String> noteContent = GeneratedColumn<String>(
    'note_content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sentimentScoreMeta = const VerificationMeta(
    'sentimentScore',
  );
  @override
  late final GeneratedColumn<double> sentimentScore = GeneratedColumn<double>(
    'sentiment_score',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    energyLevel,
    stressLevel,
    socialContextJson,
    noteContent,
    sentimentScore,
    tags,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('energy_level')) {
      context.handle(
        _energyLevelMeta,
        energyLevel.isAcceptableOrUnknown(
          data['energy_level']!,
          _energyLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_energyLevelMeta);
    }
    if (data.containsKey('stress_level')) {
      context.handle(
        _stressLevelMeta,
        stressLevel.isAcceptableOrUnknown(
          data['stress_level']!,
          _stressLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stressLevelMeta);
    }
    if (data.containsKey('social_context_json')) {
      context.handle(
        _socialContextJsonMeta,
        socialContextJson.isAcceptableOrUnknown(
          data['social_context_json']!,
          _socialContextJsonMeta,
        ),
      );
    }
    if (data.containsKey('note_content')) {
      context.handle(
        _noteContentMeta,
        noteContent.isAcceptableOrUnknown(
          data['note_content']!,
          _noteContentMeta,
        ),
      );
    }
    if (data.containsKey('sentiment_score')) {
      context.handle(
        _sentimentScoreMeta,
        sentimentScore.isAcceptableOrUnknown(
          data['sentiment_score']!,
          _sentimentScoreMeta,
        ),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      energyLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}energy_level'],
      )!,
      stressLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stress_level'],
      )!,
      socialContextJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}social_context_json'],
      ),
      noteContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_content'],
      ),
      sentimentScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sentiment_score'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
    );
  }

  @override
  $DailyEntriesTable createAlias(String alias) {
    return $DailyEntriesTable(attachedDatabase, alias);
  }
}

class DailyEntry extends DataClass implements Insertable<DailyEntry> {
  final String id;
  final DateTime createdAt;
  final int energyLevel;
  final int stressLevel;
  final String? socialContextJson;
  final String? noteContent;
  final double? sentimentScore;
  final String? tags;
  const DailyEntry({
    required this.id,
    required this.createdAt,
    required this.energyLevel,
    required this.stressLevel,
    this.socialContextJson,
    this.noteContent,
    this.sentimentScore,
    this.tags,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['energy_level'] = Variable<int>(energyLevel);
    map['stress_level'] = Variable<int>(stressLevel);
    if (!nullToAbsent || socialContextJson != null) {
      map['social_context_json'] = Variable<String>(socialContextJson);
    }
    if (!nullToAbsent || noteContent != null) {
      map['note_content'] = Variable<String>(noteContent);
    }
    if (!nullToAbsent || sentimentScore != null) {
      map['sentiment_score'] = Variable<double>(sentimentScore);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    return map;
  }

  DailyEntriesCompanion toCompanion(bool nullToAbsent) {
    return DailyEntriesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      energyLevel: Value(energyLevel),
      stressLevel: Value(stressLevel),
      socialContextJson: socialContextJson == null && nullToAbsent
          ? const Value.absent()
          : Value(socialContextJson),
      noteContent: noteContent == null && nullToAbsent
          ? const Value.absent()
          : Value(noteContent),
      sentimentScore: sentimentScore == null && nullToAbsent
          ? const Value.absent()
          : Value(sentimentScore),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
    );
  }

  factory DailyEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyEntry(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      energyLevel: serializer.fromJson<int>(json['energyLevel']),
      stressLevel: serializer.fromJson<int>(json['stressLevel']),
      socialContextJson: serializer.fromJson<String?>(
        json['socialContextJson'],
      ),
      noteContent: serializer.fromJson<String?>(json['noteContent']),
      sentimentScore: serializer.fromJson<double?>(json['sentimentScore']),
      tags: serializer.fromJson<String?>(json['tags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'energyLevel': serializer.toJson<int>(energyLevel),
      'stressLevel': serializer.toJson<int>(stressLevel),
      'socialContextJson': serializer.toJson<String?>(socialContextJson),
      'noteContent': serializer.toJson<String?>(noteContent),
      'sentimentScore': serializer.toJson<double?>(sentimentScore),
      'tags': serializer.toJson<String?>(tags),
    };
  }

  DailyEntry copyWith({
    String? id,
    DateTime? createdAt,
    int? energyLevel,
    int? stressLevel,
    Value<String?> socialContextJson = const Value.absent(),
    Value<String?> noteContent = const Value.absent(),
    Value<double?> sentimentScore = const Value.absent(),
    Value<String?> tags = const Value.absent(),
  }) => DailyEntry(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    energyLevel: energyLevel ?? this.energyLevel,
    stressLevel: stressLevel ?? this.stressLevel,
    socialContextJson: socialContextJson.present
        ? socialContextJson.value
        : this.socialContextJson,
    noteContent: noteContent.present ? noteContent.value : this.noteContent,
    sentimentScore: sentimentScore.present
        ? sentimentScore.value
        : this.sentimentScore,
    tags: tags.present ? tags.value : this.tags,
  );
  DailyEntry copyWithCompanion(DailyEntriesCompanion data) {
    return DailyEntry(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      energyLevel: data.energyLevel.present
          ? data.energyLevel.value
          : this.energyLevel,
      stressLevel: data.stressLevel.present
          ? data.stressLevel.value
          : this.stressLevel,
      socialContextJson: data.socialContextJson.present
          ? data.socialContextJson.value
          : this.socialContextJson,
      noteContent: data.noteContent.present
          ? data.noteContent.value
          : this.noteContent,
      sentimentScore: data.sentimentScore.present
          ? data.sentimentScore.value
          : this.sentimentScore,
      tags: data.tags.present ? data.tags.value : this.tags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyEntry(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('stressLevel: $stressLevel, ')
          ..write('socialContextJson: $socialContextJson, ')
          ..write('noteContent: $noteContent, ')
          ..write('sentimentScore: $sentimentScore, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    energyLevel,
    stressLevel,
    socialContextJson,
    noteContent,
    sentimentScore,
    tags,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyEntry &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.energyLevel == this.energyLevel &&
          other.stressLevel == this.stressLevel &&
          other.socialContextJson == this.socialContextJson &&
          other.noteContent == this.noteContent &&
          other.sentimentScore == this.sentimentScore &&
          other.tags == this.tags);
}

class DailyEntriesCompanion extends UpdateCompanion<DailyEntry> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<int> energyLevel;
  final Value<int> stressLevel;
  final Value<String?> socialContextJson;
  final Value<String?> noteContent;
  final Value<double?> sentimentScore;
  final Value<String?> tags;
  final Value<int> rowid;
  const DailyEntriesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.energyLevel = const Value.absent(),
    this.stressLevel = const Value.absent(),
    this.socialContextJson = const Value.absent(),
    this.noteContent = const Value.absent(),
    this.sentimentScore = const Value.absent(),
    this.tags = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyEntriesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    required int energyLevel,
    required int stressLevel,
    this.socialContextJson = const Value.absent(),
    this.noteContent = const Value.absent(),
    this.sentimentScore = const Value.absent(),
    this.tags = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       energyLevel = Value(energyLevel),
       stressLevel = Value(stressLevel);
  static Insertable<DailyEntry> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<int>? energyLevel,
    Expression<int>? stressLevel,
    Expression<String>? socialContextJson,
    Expression<String>? noteContent,
    Expression<double>? sentimentScore,
    Expression<String>? tags,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (energyLevel != null) 'energy_level': energyLevel,
      if (stressLevel != null) 'stress_level': stressLevel,
      if (socialContextJson != null) 'social_context_json': socialContextJson,
      if (noteContent != null) 'note_content': noteContent,
      if (sentimentScore != null) 'sentiment_score': sentimentScore,
      if (tags != null) 'tags': tags,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyEntriesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<int>? energyLevel,
    Value<int>? stressLevel,
    Value<String?>? socialContextJson,
    Value<String?>? noteContent,
    Value<double?>? sentimentScore,
    Value<String?>? tags,
    Value<int>? rowid,
  }) {
    return DailyEntriesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      energyLevel: energyLevel ?? this.energyLevel,
      stressLevel: stressLevel ?? this.stressLevel,
      socialContextJson: socialContextJson ?? this.socialContextJson,
      noteContent: noteContent ?? this.noteContent,
      sentimentScore: sentimentScore ?? this.sentimentScore,
      tags: tags ?? this.tags,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (energyLevel.present) {
      map['energy_level'] = Variable<int>(energyLevel.value);
    }
    if (stressLevel.present) {
      map['stress_level'] = Variable<int>(stressLevel.value);
    }
    if (socialContextJson.present) {
      map['social_context_json'] = Variable<String>(socialContextJson.value);
    }
    if (noteContent.present) {
      map['note_content'] = Variable<String>(noteContent.value);
    }
    if (sentimentScore.present) {
      map['sentiment_score'] = Variable<double>(sentimentScore.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyEntriesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('stressLevel: $stressLevel, ')
          ..write('socialContextJson: $socialContextJson, ')
          ..write('noteContent: $noteContent, ')
          ..write('sentimentScore: $sentimentScore, ')
          ..write('tags: $tags, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActionFeedbacksTable extends ActionFeedbacks
    with TableInfo<$ActionFeedbacksTable, ActionFeedback> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionFeedbacksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entryIdMeta = const VerificationMeta(
    'entryId',
  );
  @override
  late final GeneratedColumn<String> entryId = GeneratedColumn<String>(
    'entry_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES daily_entries (id)',
    ),
  );
  static const VerificationMeta _actionTypeMeta = const VerificationMeta(
    'actionType',
  );
  @override
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
    'action_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _userRatingMeta = const VerificationMeta(
    'userRating',
  );
  @override
  late final GeneratedColumn<int> userRating = GeneratedColumn<int>(
    'user_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entryId,
    actionType,
    completed,
    userRating,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_feedbacks';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActionFeedback> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entry_id')) {
      context.handle(
        _entryIdMeta,
        entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('action_type')) {
      context.handle(
        _actionTypeMeta,
        actionType.isAcceptableOrUnknown(data['action_type']!, _actionTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    if (data.containsKey('user_rating')) {
      context.handle(
        _userRatingMeta,
        userRating.isAcceptableOrUnknown(data['user_rating']!, _userRatingMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActionFeedback map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionFeedback(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry_id'],
      )!,
      actionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_type'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
      userRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_rating'],
      ),
    );
  }

  @override
  $ActionFeedbacksTable createAlias(String alias) {
    return $ActionFeedbacksTable(attachedDatabase, alias);
  }
}

class ActionFeedback extends DataClass implements Insertable<ActionFeedback> {
  final String id;
  final String entryId;
  final String actionType;
  final bool completed;
  final int? userRating;
  const ActionFeedback({
    required this.id,
    required this.entryId,
    required this.actionType,
    required this.completed,
    this.userRating,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entry_id'] = Variable<String>(entryId);
    map['action_type'] = Variable<String>(actionType);
    map['completed'] = Variable<bool>(completed);
    if (!nullToAbsent || userRating != null) {
      map['user_rating'] = Variable<int>(userRating);
    }
    return map;
  }

  ActionFeedbacksCompanion toCompanion(bool nullToAbsent) {
    return ActionFeedbacksCompanion(
      id: Value(id),
      entryId: Value(entryId),
      actionType: Value(actionType),
      completed: Value(completed),
      userRating: userRating == null && nullToAbsent
          ? const Value.absent()
          : Value(userRating),
    );
  }

  factory ActionFeedback.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionFeedback(
      id: serializer.fromJson<String>(json['id']),
      entryId: serializer.fromJson<String>(json['entryId']),
      actionType: serializer.fromJson<String>(json['actionType']),
      completed: serializer.fromJson<bool>(json['completed']),
      userRating: serializer.fromJson<int?>(json['userRating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entryId': serializer.toJson<String>(entryId),
      'actionType': serializer.toJson<String>(actionType),
      'completed': serializer.toJson<bool>(completed),
      'userRating': serializer.toJson<int?>(userRating),
    };
  }

  ActionFeedback copyWith({
    String? id,
    String? entryId,
    String? actionType,
    bool? completed,
    Value<int?> userRating = const Value.absent(),
  }) => ActionFeedback(
    id: id ?? this.id,
    entryId: entryId ?? this.entryId,
    actionType: actionType ?? this.actionType,
    completed: completed ?? this.completed,
    userRating: userRating.present ? userRating.value : this.userRating,
  );
  ActionFeedback copyWithCompanion(ActionFeedbacksCompanion data) {
    return ActionFeedback(
      id: data.id.present ? data.id.value : this.id,
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      actionType: data.actionType.present
          ? data.actionType.value
          : this.actionType,
      completed: data.completed.present ? data.completed.value : this.completed,
      userRating: data.userRating.present
          ? data.userRating.value
          : this.userRating,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionFeedback(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('actionType: $actionType, ')
          ..write('completed: $completed, ')
          ..write('userRating: $userRating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, entryId, actionType, completed, userRating);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionFeedback &&
          other.id == this.id &&
          other.entryId == this.entryId &&
          other.actionType == this.actionType &&
          other.completed == this.completed &&
          other.userRating == this.userRating);
}

class ActionFeedbacksCompanion extends UpdateCompanion<ActionFeedback> {
  final Value<String> id;
  final Value<String> entryId;
  final Value<String> actionType;
  final Value<bool> completed;
  final Value<int?> userRating;
  final Value<int> rowid;
  const ActionFeedbacksCompanion({
    this.id = const Value.absent(),
    this.entryId = const Value.absent(),
    this.actionType = const Value.absent(),
    this.completed = const Value.absent(),
    this.userRating = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActionFeedbacksCompanion.insert({
    required String id,
    required String entryId,
    required String actionType,
    this.completed = const Value.absent(),
    this.userRating = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entryId = Value(entryId),
       actionType = Value(actionType);
  static Insertable<ActionFeedback> custom({
    Expression<String>? id,
    Expression<String>? entryId,
    Expression<String>? actionType,
    Expression<bool>? completed,
    Expression<int>? userRating,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryId != null) 'entry_id': entryId,
      if (actionType != null) 'action_type': actionType,
      if (completed != null) 'completed': completed,
      if (userRating != null) 'user_rating': userRating,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActionFeedbacksCompanion copyWith({
    Value<String>? id,
    Value<String>? entryId,
    Value<String>? actionType,
    Value<bool>? completed,
    Value<int?>? userRating,
    Value<int>? rowid,
  }) {
    return ActionFeedbacksCompanion(
      id: id ?? this.id,
      entryId: entryId ?? this.entryId,
      actionType: actionType ?? this.actionType,
      completed: completed ?? this.completed,
      userRating: userRating ?? this.userRating,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<String>(entryId.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (userRating.present) {
      map['user_rating'] = Variable<int>(userRating.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionFeedbacksCompanion(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('actionType: $actionType, ')
          ..write('completed: $completed, ')
          ..write('userRating: $userRating, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DailyEntriesTable dailyEntries = $DailyEntriesTable(this);
  late final $ActionFeedbacksTable actionFeedbacks = $ActionFeedbacksTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dailyEntries,
    actionFeedbacks,
  ];
}

typedef $$DailyEntriesTableCreateCompanionBuilder =
    DailyEntriesCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      required int energyLevel,
      required int stressLevel,
      Value<String?> socialContextJson,
      Value<String?> noteContent,
      Value<double?> sentimentScore,
      Value<String?> tags,
      Value<int> rowid,
    });
typedef $$DailyEntriesTableUpdateCompanionBuilder =
    DailyEntriesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<int> energyLevel,
      Value<int> stressLevel,
      Value<String?> socialContextJson,
      Value<String?> noteContent,
      Value<double?> sentimentScore,
      Value<String?> tags,
      Value<int> rowid,
    });

final class $$DailyEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $DailyEntriesTable, DailyEntry> {
  $$DailyEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ActionFeedbacksTable, List<ActionFeedback>>
  _actionFeedbacksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.actionFeedbacks,
    aliasName: $_aliasNameGenerator(
      db.dailyEntries.id,
      db.actionFeedbacks.entryId,
    ),
  );

  $$ActionFeedbacksTableProcessedTableManager get actionFeedbacksRefs {
    final manager = $$ActionFeedbacksTableTableManager(
      $_db,
      $_db.actionFeedbacks,
    ).filter((f) => f.entryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _actionFeedbacksRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DailyEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DailyEntriesTable> {
  $$DailyEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stressLevel => $composableBuilder(
    column: $table.stressLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get socialContextJson => $composableBuilder(
    column: $table.socialContextJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteContent => $composableBuilder(
    column: $table.noteContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sentimentScore => $composableBuilder(
    column: $table.sentimentScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> actionFeedbacksRefs(
    Expression<bool> Function($$ActionFeedbacksTableFilterComposer f) f,
  ) {
    final $$ActionFeedbacksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.actionFeedbacks,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActionFeedbacksTableFilterComposer(
            $db: $db,
            $table: $db.actionFeedbacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DailyEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyEntriesTable> {
  $$DailyEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stressLevel => $composableBuilder(
    column: $table.stressLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get socialContextJson => $composableBuilder(
    column: $table.socialContextJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteContent => $composableBuilder(
    column: $table.noteContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sentimentScore => $composableBuilder(
    column: $table.sentimentScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyEntriesTable> {
  $$DailyEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stressLevel => $composableBuilder(
    column: $table.stressLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get socialContextJson => $composableBuilder(
    column: $table.socialContextJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get noteContent => $composableBuilder(
    column: $table.noteContent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sentimentScore => $composableBuilder(
    column: $table.sentimentScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  Expression<T> actionFeedbacksRefs<T extends Object>(
    Expression<T> Function($$ActionFeedbacksTableAnnotationComposer a) f,
  ) {
    final $$ActionFeedbacksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.actionFeedbacks,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActionFeedbacksTableAnnotationComposer(
            $db: $db,
            $table: $db.actionFeedbacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DailyEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyEntriesTable,
          DailyEntry,
          $$DailyEntriesTableFilterComposer,
          $$DailyEntriesTableOrderingComposer,
          $$DailyEntriesTableAnnotationComposer,
          $$DailyEntriesTableCreateCompanionBuilder,
          $$DailyEntriesTableUpdateCompanionBuilder,
          (DailyEntry, $$DailyEntriesTableReferences),
          DailyEntry,
          PrefetchHooks Function({bool actionFeedbacksRefs})
        > {
  $$DailyEntriesTableTableManager(_$AppDatabase db, $DailyEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> energyLevel = const Value.absent(),
                Value<int> stressLevel = const Value.absent(),
                Value<String?> socialContextJson = const Value.absent(),
                Value<String?> noteContent = const Value.absent(),
                Value<double?> sentimentScore = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyEntriesCompanion(
                id: id,
                createdAt: createdAt,
                energyLevel: energyLevel,
                stressLevel: stressLevel,
                socialContextJson: socialContextJson,
                noteContent: noteContent,
                sentimentScore: sentimentScore,
                tags: tags,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                required int energyLevel,
                required int stressLevel,
                Value<String?> socialContextJson = const Value.absent(),
                Value<String?> noteContent = const Value.absent(),
                Value<double?> sentimentScore = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyEntriesCompanion.insert(
                id: id,
                createdAt: createdAt,
                energyLevel: energyLevel,
                stressLevel: stressLevel,
                socialContextJson: socialContextJson,
                noteContent: noteContent,
                sentimentScore: sentimentScore,
                tags: tags,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DailyEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({actionFeedbacksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (actionFeedbacksRefs) db.actionFeedbacks,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (actionFeedbacksRefs)
                    await $_getPrefetchedData<
                      DailyEntry,
                      $DailyEntriesTable,
                      ActionFeedback
                    >(
                      currentTable: table,
                      referencedTable: $$DailyEntriesTableReferences
                          ._actionFeedbacksRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DailyEntriesTableReferences(
                            db,
                            table,
                            p0,
                          ).actionFeedbacksRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.entryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DailyEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyEntriesTable,
      DailyEntry,
      $$DailyEntriesTableFilterComposer,
      $$DailyEntriesTableOrderingComposer,
      $$DailyEntriesTableAnnotationComposer,
      $$DailyEntriesTableCreateCompanionBuilder,
      $$DailyEntriesTableUpdateCompanionBuilder,
      (DailyEntry, $$DailyEntriesTableReferences),
      DailyEntry,
      PrefetchHooks Function({bool actionFeedbacksRefs})
    >;
typedef $$ActionFeedbacksTableCreateCompanionBuilder =
    ActionFeedbacksCompanion Function({
      required String id,
      required String entryId,
      required String actionType,
      Value<bool> completed,
      Value<int?> userRating,
      Value<int> rowid,
    });
typedef $$ActionFeedbacksTableUpdateCompanionBuilder =
    ActionFeedbacksCompanion Function({
      Value<String> id,
      Value<String> entryId,
      Value<String> actionType,
      Value<bool> completed,
      Value<int?> userRating,
      Value<int> rowid,
    });

final class $$ActionFeedbacksTableReferences
    extends
        BaseReferences<_$AppDatabase, $ActionFeedbacksTable, ActionFeedback> {
  $$ActionFeedbacksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DailyEntriesTable _entryIdTable(_$AppDatabase db) =>
      db.dailyEntries.createAlias(
        $_aliasNameGenerator(db.actionFeedbacks.entryId, db.dailyEntries.id),
      );

  $$DailyEntriesTableProcessedTableManager get entryId {
    final $_column = $_itemColumn<String>('entry_id')!;

    final manager = $$DailyEntriesTableTableManager(
      $_db,
      $_db.dailyEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ActionFeedbacksTableFilterComposer
    extends Composer<_$AppDatabase, $ActionFeedbacksTable> {
  $$ActionFeedbacksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userRating => $composableBuilder(
    column: $table.userRating,
    builder: (column) => ColumnFilters(column),
  );

  $$DailyEntriesTableFilterComposer get entryId {
    final $$DailyEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.dailyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyEntriesTableFilterComposer(
            $db: $db,
            $table: $db.dailyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActionFeedbacksTableOrderingComposer
    extends Composer<_$AppDatabase, $ActionFeedbacksTable> {
  $$ActionFeedbacksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userRating => $composableBuilder(
    column: $table.userRating,
    builder: (column) => ColumnOrderings(column),
  );

  $$DailyEntriesTableOrderingComposer get entryId {
    final $$DailyEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.dailyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.dailyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActionFeedbacksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActionFeedbacksTable> {
  $$ActionFeedbacksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<int> get userRating => $composableBuilder(
    column: $table.userRating,
    builder: (column) => column,
  );

  $$DailyEntriesTableAnnotationComposer get entryId {
    final $$DailyEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.dailyEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dailyEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActionFeedbacksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActionFeedbacksTable,
          ActionFeedback,
          $$ActionFeedbacksTableFilterComposer,
          $$ActionFeedbacksTableOrderingComposer,
          $$ActionFeedbacksTableAnnotationComposer,
          $$ActionFeedbacksTableCreateCompanionBuilder,
          $$ActionFeedbacksTableUpdateCompanionBuilder,
          (ActionFeedback, $$ActionFeedbacksTableReferences),
          ActionFeedback,
          PrefetchHooks Function({bool entryId})
        > {
  $$ActionFeedbacksTableTableManager(
    _$AppDatabase db,
    $ActionFeedbacksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActionFeedbacksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActionFeedbacksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActionFeedbacksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entryId = const Value.absent(),
                Value<String> actionType = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<int?> userRating = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActionFeedbacksCompanion(
                id: id,
                entryId: entryId,
                actionType: actionType,
                completed: completed,
                userRating: userRating,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entryId,
                required String actionType,
                Value<bool> completed = const Value.absent(),
                Value<int?> userRating = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActionFeedbacksCompanion.insert(
                id: id,
                entryId: entryId,
                actionType: actionType,
                completed: completed,
                userRating: userRating,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ActionFeedbacksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({entryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (entryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.entryId,
                                referencedTable:
                                    $$ActionFeedbacksTableReferences
                                        ._entryIdTable(db),
                                referencedColumn:
                                    $$ActionFeedbacksTableReferences
                                        ._entryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ActionFeedbacksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActionFeedbacksTable,
      ActionFeedback,
      $$ActionFeedbacksTableFilterComposer,
      $$ActionFeedbacksTableOrderingComposer,
      $$ActionFeedbacksTableAnnotationComposer,
      $$ActionFeedbacksTableCreateCompanionBuilder,
      $$ActionFeedbacksTableUpdateCompanionBuilder,
      (ActionFeedback, $$ActionFeedbacksTableReferences),
      ActionFeedback,
      PrefetchHooks Function({bool entryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DailyEntriesTableTableManager get dailyEntries =>
      $$DailyEntriesTableTableManager(_db, _db.dailyEntries);
  $$ActionFeedbacksTableTableManager get actionFeedbacks =>
      $$ActionFeedbacksTableTableManager(_db, _db.actionFeedbacks);
}
