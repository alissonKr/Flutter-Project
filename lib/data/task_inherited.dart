import 'package:flutter/material.dart';
import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<task> taskList = [
    task('Aprender Flutter', 'assets/images/dash.png', 3),
    task('Andar de Bike', 'assets/images/bike.jpg', 2),
    task('Meditar', 'assets/images/meditar.jpg', 5),
    task(
      'Ler',
      'assets/images/ler.jpg',
      4,
    ),
    task('Jogar', 'assets/images/jogar.jpg', 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No taskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
