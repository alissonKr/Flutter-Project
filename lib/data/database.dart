
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async{
  final String path = join( await getDatabasePath(), 'task.db');
  return openDatabase(path, onCreate: (db, version){db.execute(tableSql)}, version: 1,);
}

const String tableSql ='CREATE TABLE $_tablename('
    '$_name TEXT, '
    '$_difficulty INTEGER, '
    '$_image TEXT)'; 

const String _tablename = 'taskTabl';
const String _name = 'name';
const String _difficulty = 'difficulty';
const String _image = 'image';