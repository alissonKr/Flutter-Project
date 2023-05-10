import 'package:alura/components/task.dart';
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
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          task('Aprender Flutter', 'assets/images/dash.png', 3),
          task('Andar de Bike', 'assets/images/bike.jpg', 2),
          task('Meditar', 'assets/images/meditar.jpg', 5),
          task(
            'Ler',
            'assets/images/ler.jpg',
            4,
          ),
          task('Jogar', 'assets/images/jogar.jpg', 1),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
