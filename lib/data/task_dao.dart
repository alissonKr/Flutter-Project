// ignore_for_file: prefer_final_fields, avoid_print, prefer_collection_literals

import 'package:alura/components/task.dart';
import 'package:alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static String tableSql = 'CREATE TABLE $_tablename('
      '$_uuid TEXT, '
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT, '
      '$_nivel INTEGER)';

  static String _uuid = 'uuid';
  static String _tablename = 'taskTabl';
  static String _name = 'name';
  static String _difficulty = 'difficulty';
  static String _image = 'image';
  static String _nivel = 'level';

  save(Task tarefa) async {
    print('Iniciando o save: ');
    final Database bandoDeDados = await getDatabase();
    var itemExist = await find(tarefa.uuid);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExist.isEmpty) {
      print('A tarefa não existia.');
      return await bandoDeDados.insert(_tablename, taskMap);
    } else {
      print('A tarefa já existia!');
      return await bandoDeDados.update(
        _tablename,
        taskMap,
        where: '$_uuid = ?',
        whereArgs: [tarefa.uuid],
      );
    }
  }

  updateLevel(Task tarefa) async {
    final Database bancoDeDados = await getDatabase();
    Map<String, dynamic> taskMap = toMap(tarefa);
    return await bancoDeDados.update(
      _tablename,
      taskMap,
      where: '$_uuid = ?',
      whereArgs: [tarefa.uuid],
    );
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo Tarefa em map: ');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_uuid] = tarefa.uuid;
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_nivel] = tarefa.nivel;
    print('Mapa de Tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Estamos acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado? $result');
    return toList(result);
  }

   List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    List<Task> tarefas = [];

    for (Map<String, dynamic> linha in mapaDeTarefas) {
      var uuid = linha[_uuid];
      var name = linha[_name];
      var image = linha[_image];
      var difficulty = linha[_difficulty];
      var nivel = linha[_nivel];
      final Task tarefa = Task(uuid, name, image, difficulty, nivel);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Future<List<Task>> find(String uuid) async {
    print('acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_uuid = ?',
      whereArgs: [uuid],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String uuidDaTarefa) async {
    print('Deletando tarefa: $_name');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: '$_uuid = ?', whereArgs: [uuidDaTarefa]);
  }
}
