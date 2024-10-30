// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RuleDao? _ruleDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 9,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Rule` (`id` TEXT NOT NULL, `createTime` INTEGER NOT NULL, `modifiedTime` INTEGER NOT NULL, `enableUpload` INTEGER NOT NULL, `author` TEXT NOT NULL, `postScript` TEXT NOT NULL, `name` TEXT NOT NULL, `host` TEXT NOT NULL, `icon` TEXT NOT NULL, `contentType` INTEGER NOT NULL, `group` TEXT NOT NULL, `sort` INTEGER NOT NULL, `viewStyle` INTEGER NOT NULL, `useCryptoJS` INTEGER NOT NULL, `loadJs` TEXT NOT NULL, `userAgent` TEXT NOT NULL, `loginUrl` TEXT NOT NULL, `cookies` TEXT NOT NULL, `enableDiscover` INTEGER NOT NULL, `discoverUrl` TEXT NOT NULL, `discoverNextUrl` TEXT NOT NULL, `discoverItems` TEXT NOT NULL, `discoverList` TEXT NOT NULL, `discoverTags` TEXT NOT NULL, `discoverName` TEXT NOT NULL, `discoverCover` TEXT NOT NULL, `discoverAuthor` TEXT NOT NULL, `discoverChapter` TEXT NOT NULL, `discoverDescription` TEXT NOT NULL, `discoverResult` TEXT NOT NULL, `enableSearch` INTEGER NOT NULL, `searchUrl` TEXT NOT NULL, `searchNextUrl` TEXT NOT NULL, `searchItems` TEXT NOT NULL, `searchList` TEXT NOT NULL, `searchTags` TEXT NOT NULL, `searchName` TEXT NOT NULL, `searchCover` TEXT NOT NULL, `searchAuthor` TEXT NOT NULL, `searchChapter` TEXT NOT NULL, `searchDescription` TEXT NOT NULL, `searchResult` TEXT NOT NULL, `enableMultiRoads` INTEGER NOT NULL, `chapterUrl` TEXT NOT NULL, `chapterNextUrl` TEXT NOT NULL, `chapterRoads` TEXT NOT NULL, `chapterRoadName` TEXT NOT NULL, `chapterItems` TEXT NOT NULL, `chapterList` TEXT NOT NULL, `chapterName` TEXT NOT NULL, `chapterCover` TEXT NOT NULL, `chapterLock` TEXT NOT NULL, `chapterTime` TEXT NOT NULL, `chapterResult` TEXT NOT NULL, `contentUrl` TEXT NOT NULL, `contentNextUrl` TEXT NOT NULL, `contentItems` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RuleDao get ruleDao {
    return _ruleDaoInstance ??= _$RuleDao(database, changeListener);
  }
}

class _$RuleDao extends RuleDao {
  _$RuleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _ruleInsertionAdapter = InsertionAdapter(
            database,
            'Rule',
            (Rule item) => <String, Object?>{
                  'id': item.id,
                  'createTime': item.createTime,
                  'modifiedTime': item.modifiedTime,
                  'enableUpload': item.enableUpload ? 1 : 0,
                  'author': item.author,
                  'postScript': item.postScript,
                  'name': item.name,
                  'host': item.host,
                  'icon': item.icon,
                  'contentType': item.contentType,
                  'group': item.group,
                  'sort': item.sort,
                  'viewStyle': item.viewStyle,
                  'useCryptoJS': item.useCryptoJS ? 1 : 0,
                  'loadJs': item.loadJs,
                  'userAgent': item.userAgent,
                  'loginUrl': item.loginUrl,
                  'cookies': item.cookies,
                  'enableDiscover': item.enableDiscover ? 1 : 0,
                  'discoverUrl': item.discoverUrl,
                  'discoverNextUrl': item.discoverNextUrl,
                  'discoverItems': item.discoverItems,
                  'discoverList': item.discoverList,
                  'discoverTags': item.discoverTags,
                  'discoverName': item.discoverName,
                  'discoverCover': item.discoverCover,
                  'discoverAuthor': item.discoverAuthor,
                  'discoverChapter': item.discoverChapter,
                  'discoverDescription': item.discoverDescription,
                  'discoverResult': item.discoverResult,
                  'enableSearch': item.enableSearch ? 1 : 0,
                  'searchUrl': item.searchUrl,
                  'searchNextUrl': item.searchNextUrl,
                  'searchItems': item.searchItems,
                  'searchList': item.searchList,
                  'searchTags': item.searchTags,
                  'searchName': item.searchName,
                  'searchCover': item.searchCover,
                  'searchAuthor': item.searchAuthor,
                  'searchChapter': item.searchChapter,
                  'searchDescription': item.searchDescription,
                  'searchResult': item.searchResult,
                  'enableMultiRoads': item.enableMultiRoads ? 1 : 0,
                  'chapterUrl': item.chapterUrl,
                  'chapterNextUrl': item.chapterNextUrl,
                  'chapterRoads': item.chapterRoads,
                  'chapterRoadName': item.chapterRoadName,
                  'chapterItems': item.chapterItems,
                  'chapterList': item.chapterList,
                  'chapterName': item.chapterName,
                  'chapterCover': item.chapterCover,
                  'chapterLock': item.chapterLock,
                  'chapterTime': item.chapterTime,
                  'chapterResult': item.chapterResult,
                  'contentUrl': item.contentUrl,
                  'contentNextUrl': item.contentNextUrl,
                  'contentItems': item.contentItems
                }),
        _ruleDeletionAdapter = DeletionAdapter(
            database,
            'Rule',
            ['id'],
            (Rule item) => <String, Object?>{
                  'id': item.id,
                  'createTime': item.createTime,
                  'modifiedTime': item.modifiedTime,
                  'enableUpload': item.enableUpload ? 1 : 0,
                  'author': item.author,
                  'postScript': item.postScript,
                  'name': item.name,
                  'host': item.host,
                  'icon': item.icon,
                  'contentType': item.contentType,
                  'group': item.group,
                  'sort': item.sort,
                  'viewStyle': item.viewStyle,
                  'useCryptoJS': item.useCryptoJS ? 1 : 0,
                  'loadJs': item.loadJs,
                  'userAgent': item.userAgent,
                  'loginUrl': item.loginUrl,
                  'cookies': item.cookies,
                  'enableDiscover': item.enableDiscover ? 1 : 0,
                  'discoverUrl': item.discoverUrl,
                  'discoverNextUrl': item.discoverNextUrl,
                  'discoverItems': item.discoverItems,
                  'discoverList': item.discoverList,
                  'discoverTags': item.discoverTags,
                  'discoverName': item.discoverName,
                  'discoverCover': item.discoverCover,
                  'discoverAuthor': item.discoverAuthor,
                  'discoverChapter': item.discoverChapter,
                  'discoverDescription': item.discoverDescription,
                  'discoverResult': item.discoverResult,
                  'enableSearch': item.enableSearch ? 1 : 0,
                  'searchUrl': item.searchUrl,
                  'searchNextUrl': item.searchNextUrl,
                  'searchItems': item.searchItems,
                  'searchList': item.searchList,
                  'searchTags': item.searchTags,
                  'searchName': item.searchName,
                  'searchCover': item.searchCover,
                  'searchAuthor': item.searchAuthor,
                  'searchChapter': item.searchChapter,
                  'searchDescription': item.searchDescription,
                  'searchResult': item.searchResult,
                  'enableMultiRoads': item.enableMultiRoads ? 1 : 0,
                  'chapterUrl': item.chapterUrl,
                  'chapterNextUrl': item.chapterNextUrl,
                  'chapterRoads': item.chapterRoads,
                  'chapterRoadName': item.chapterRoadName,
                  'chapterItems': item.chapterItems,
                  'chapterList': item.chapterList,
                  'chapterName': item.chapterName,
                  'chapterCover': item.chapterCover,
                  'chapterLock': item.chapterLock,
                  'chapterTime': item.chapterTime,
                  'chapterResult': item.chapterResult,
                  'contentUrl': item.contentUrl,
                  'contentNextUrl': item.contentNextUrl,
                  'contentItems': item.contentItems
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Rule> _ruleInsertionAdapter;

  final DeletionAdapter<Rule> _ruleDeletionAdapter;

  @override
  Future<Rule?> findRuleById(String id) async {
    return _queryAdapter.query('SELECT * FROM rule WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Rule(), arguments: [id]);
  }

  @override
  Future<List<Rule>> findAllRules() async {
    return _queryAdapter.queryList(
        'SELECT * FROM rule ORDER BY \${RuleDao.order}',
        mapper: (Map<String, Object?> row) => Rule());
  }

  @override
  Future<List<Rule>> findAllDiscoverRules() async {
    return _queryAdapter.queryList(
        'SELECT * FROM rule where enableDiscover = 1 ORDER BY \${RuleDao.order}',
        mapper: (Map<String, Object?> row) => Rule());
  }

  @override
  Future<List<Rule>> findUploadRules() async {
    return _queryAdapter.queryList('SELECT * FROM rule where enableUpload = 1',
        mapper: (Map<String, Object?> row) => Rule());
  }

  @override
  Future<Rule?> findMaxSort() async {
    return _queryAdapter.query('SELECT * FROM rule order by sort desc limit 1',
        mapper: (Map<String, Object?> row) => Rule());
  }

  @override
  Future<void> clearAllRules() async {
    await _queryAdapter.queryNoReturn('DELETE FROM rule');
  }

  @override
  Future<List<Rule>> getRuleByName(String name) async {
    return _queryAdapter.queryList(
        'SELECT * FROM rule WHERE name like ?1 or `group` like ?1 or author like ?1 or host like ?1 ORDER BY \${RuleDao.order}',
        mapper: (Map<String, Object?> row) => Rule(),
        arguments: [name]);
  }

  @override
  Future<List<Rule>> getDiscoverRuleByName(String name) async {
    return _queryAdapter.queryList(
        'SELECT * FROM rule WHERE enableDiscover = 1 and (name like ?1 or `group` like ?1 or author like ?1 or host like ?1) ORDER BY \${RuleDao.order}',
        mapper: (Map<String, Object?> row) => Rule(),
        arguments: [name]);
  }

  @override
  Future<int> insertOrUpdateRule(Rule rule) {
    return _ruleInsertionAdapter.insertAndReturnId(
        rule, OnConflictStrategy.replace);
  }

  @override
  Future<List<int>> insertOrUpdateRules(List<Rule> rules) {
    return _ruleInsertionAdapter.insertListAndReturnIds(
        rules, OnConflictStrategy.replace);
  }

  @override
  Future<int> deleteRule(Rule rule) {
    return _ruleDeletionAdapter.deleteAndReturnChangedRows(rule);
  }

  @override
  Future<int> deleteRules(List<Rule> rules) {
    return _ruleDeletionAdapter.deleteListAndReturnChangedRows(rules);
  }
}
