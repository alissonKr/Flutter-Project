import 'package:alura/components/task.dart';
import 'package:alura/data/task_dao.dart';
import 'package:alura/data/task_inherited.dart';
import 'package:alura/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        //leading: SizedBox(),
        title: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Tarefas',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.change_circle_outlined,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: 1,
                  ),
                ),
                Text(
                  'Level: ',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<task>>(future: TaskDao().findAll(), builder: (context, snapshot){
          List<task>? items = snapshot.data;
          return ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int index){
            final task tarefa = items[index];
            return tarefa;
          });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
