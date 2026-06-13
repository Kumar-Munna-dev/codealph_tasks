import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataHelper {
  final int? id;
  final String question, answer, category;

  DataHelper({
    this.id,
    required this.question,
    required this.answer,
    required this.category,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'question': question,
    'answer': answer,
    'category': category,
  };

  factory DataHelper.fromMap(Map<String, dynamic> m) => DataHelper(
    id: m['id'],
    question: m['question'],
    answer: m['answer'],
    category: m['category'],
  );
}

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static const _table = 'DataTable';
  Database? _db;

  Future<Database> get _database async => _db ??= await openDatabase(
    join(await getDatabasesPath(), 'dataHelper.db'),
    version: 1,
    onCreate: (db, _) => db.execute('''
          CREATE TABLE $_table (
            id       INTEGER PRIMARY KEY AUTOINCREMENT,
            question TEXT,
            answer   TEXT,
            category TEXT
          )'''),
  );

  Future<int> insert(DataHelper dataHelper) async =>
      (await _database).insert(_table, dataHelper.toMap());

  Future<int> update(DataHelper dataHelper) async => (await _database).update(
    _table,
    dataHelper.toMap(),
    where: 'id = ?',
    whereArgs: [dataHelper.id],
  );

  Future<int> delete(int id) async =>
      (await _database).delete(_table, where: 'id = ?', whereArgs: [id]);

  Future<List<DataHelper>> getAllData() async => ((await _database).query(
    _table,
  )).then((r) => r.map(DataHelper.fromMap).toList());

  Future<List<DataHelper>> getByCategory(String cat) async =>
      ((await _database).query(
        _table,
        where: 'category = ?',
        whereArgs: [cat],
      )).then((r) => r.map(DataHelper.fromMap).toList());

  Future<List<String>> getCategories() async => ((await _database).rawQuery(
    'SELECT DISTINCT category FROM $_table',
  )).then((r) => r.map((e) => e['category'].toString()).toList());
}
