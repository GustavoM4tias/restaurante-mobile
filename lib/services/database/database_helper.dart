import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; 

class DatabaseHelper {
  static const String _dbName = 'eatzy_database.db'; 
  static const int _dbVersion = 1; 

  static DatabaseHelper? _instance; 
  static Database? _database; 

  DatabaseHelper._internal();

  static DatabaseHelper get instance{
    _instance ??= DatabaseHelper._internal();
    return _instance!; 
  }

  Future<Database> get database async{
    if(_database != null) return _database!; 
    _database = await _initDatabase(); 
    return _database!; 
  }
  
  Future<Database> _initDatabase() async{
    final path = join(await getDatabasesPath(), _dbName); 

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      );
  }

  Future _onCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE usuario (
      id_usuario INTEGER PRIMARY KEY AUTOINCREMENT, 
      nome TEXT NOT NULL,
      email TEXT UNIQUE NOT NULL, 
      senha TEXT NOT NULL
    )
    ''');

  } 

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async{
    if (oldVersion < 2){
      await db.execute('ALTER TABLE usuario ADD COLUMN pedido');
    }
  }
  Future<void> closeDatabase() async{
    final db = await database; 
    await db.close(); 
  }
  
}

