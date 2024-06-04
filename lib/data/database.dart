
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async{
  final String path = join( await getDatabasePath(), 'task.db');
  return openDatabase(path, onCreate: (db, version){db.execute(tabela)}, version: 1,);
}