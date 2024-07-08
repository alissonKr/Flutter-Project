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

  save(task tarefa) async {
    print('Iniciando o save: ');
    final Database bandoDeDados = await getDatabase();
    var itemExist = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExist.isEmpty) {
      print('A tarefa não existia.');
      return await bandoDeDados.insert(_tablename, taskMap);
    } else {
      print('A tarefa já existia!');
      return await bandoDeDados.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(task tarefa) {
    print('Convertendo Tarefa em map: ');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Mapa de Tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<task>> findAll() async {
    print('Estamos acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado? $result');
    return toList(result);
  }

  List<task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List: ');
    final List<task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final task tarefa = task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print(' Lista de Tarefas $tarefas');
    return tarefas;
  }

  Future<List<task>> find(String nomeDaTarefa) async {
    print('acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando tarefa: $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}
