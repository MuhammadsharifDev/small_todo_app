import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo_user.dart';

class LocalDatabase {
  /// Singleton patern
  LocalDatabase._init();
  static final LocalDatabase getInstance = LocalDatabase._init();
  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("toDo.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: (db, ver) async {
      const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
      const textType = "TEXT NOT NULL";
      const intType = "INTEGER DEFAULT 0";
      const boolType = 'BOOLEAN NOT NULL';

      await db.execute('''
    CREATE TABLE $userTable (
    ${ToDoSimple.id} $idType,
    ${ToDoSimple.description} $textType,
    ${ToDoSimple.time} $textType,
    ${ToDoSimple.title} $textType
    )
    ''');
    });
  }

  //----------------------------- Cached Users Table ---------------------------

  //--------------------------------- Create Users --------------------------------
  static Future<TodoFields> insertTodoFields(TodoFields todoFields) async {
    final db = await getInstance.database;
    final id = await db.insert(userTable, todoFields.toJson());
    return todoFields.copyWith(id: id);
  }

  //------------------------------ Read Users By ID -----------------------------
  static Future<TodoFields> getSingleUserById(int id) async {
    final db = await getInstance.database;
    final results = await db.query(
      userTable,
      columns: ToDoSimple.values,
      where: '${ToDoSimple.id} = ?',
      whereArgs: [id],
    );
    if (results.isNotEmpty) {
      return TodoFields.fromJson(results.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  //------------------------------ Read All Users -------------------------------
  static Future<List<TodoFields>> getAllTodoFields() async {
    final db = await getInstance.database;
    const orderBy = "${ToDoSimple.title} ASC";
    final result = await db.query(
      userTable,
      orderBy: orderBy,
    );
    return result.map((json) => TodoFields.fromJson(json)).toList();
  }

  static Future<int> updateTodoFields(TodoFields todo) async {
    Map<String, dynamic> col = {
      // TodoFieldssFields.userName: cachedUser.userName,
      ToDoSimple.title: todo.title,
    };

    final db = await getInstance.database;
    return await db.update(
      userTable,
      col,
      where: '${ToDoSimple.id} = ?',
      whereArgs: [todo.id],
    );
  }

  //------------------------------ Delete Users By ID --------------------------
  static Future<int> deleteTodoFieldsById(int id) async {
    final db = await getInstance.database;
    var t = await db
        .delete(userTable, where: "${ToDoSimple.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

  //------------------------------ Delete All User -----------------------------
  static Future<int> deleteAllTodoFields() async {
    final db = await getInstance.database;
    return await db.delete(userTable);
  }

  //--------------------------------- Close DB ---------------------------------
  static Future close() async {
    final db = await getInstance.database;
    db.close();
  }
}
