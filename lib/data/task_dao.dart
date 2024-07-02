import 'package:alura/components/task.dart';
import 'package:alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static String _tablename = 'taskTabl';
  static String _name = 'name';
  static String _difficulty = 'difficulty';
  static String _image = 'image';

  save(task tarefa) async {}
  Future<List<task>> findAll() async{
    print('Estamos acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado? $result');
    return toList(result);
  }
  List<task> toList(List<Map<String, dynamic>> mapaDeTarefas){
    print('Convertendo to List: ');
    final List<task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas){
      final task tarefa = task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print(' Lista de Tarefas $tarefas');
    return tarefas;
  }
  Future<List<task> find(String nomeDaTarefa) async {}
  delete(String nomeDaTarefa) async{}
}
