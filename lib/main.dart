import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tarefas'),
        ),
        body: ListView(
          children: [
            task('Aprender Flutter'),
            task('Andar de Bike'),
            task('Meditar'),
            task('Meditar'),
            task('Meditar'),
            task('Meditar'),
            task('Meditar'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class task extends StatefulWidget {
  final String nome;
  const task(this.nome,{Key? key}) : super(key: key);

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {
  @override
  Widget build(BuildContext context) {
    int nivel = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(child:
      Stack(
        children: [
          Container(color: Colors.blue,height:140,),
          Column(
            children: [
              Container(color:  Colors.white,height: 100,child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(color: Colors.black26, width: 72, height: 100,),
                  Container(
                      width: 200,
                      child: Text(widget.nome, style: TextStyle(fontSize: 24,
                      overflow: TextOverflow.ellipsis ),)),
                  ElevatedButton(onPressed: (){nivel ++;
                    print(nivel);}, child: Icon(Icons.arrow_drop_up))
                ],),),
              Text('Nivel $nivel', style: TextStyle(color: Colors.white, fontSize: 16),),
            ],
          )
        ],
      ),),
    );
  }
}



