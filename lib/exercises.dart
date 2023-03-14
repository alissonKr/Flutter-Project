import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'praticando flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          leading: const Icon(Icons.add_task_outlined),
          title: Text('Flutter: Primeiros Passos'),
        ),
        body: ListView(
          children: [
            WidgetsAttaks(
                color1: Colors.white,
                color2: Colors.pinkAccent,
                color3: Colors.lightBlueAccent),
            WidgetsAttaks(
                color1: Colors.pink,
                color2: Colors.purple,
                color3: Colors.blue),
            WidgetsAttaks(
                color1: Colors.pinkAccent,
                color2: Colors.yellow,
                color3: Colors.lightBlue),
            WidgetsAttaks(
                color1: Colors.deepPurpleAccent,
                color2: Colors.white,
                color3: Colors.green),
          ],
        ),
      ),
    );
  }
}

class WidgetsAttaks extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  const WidgetsAttaks(
      {required this.color1,
      required this.color2,
      required this.color3,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetContainer(color: color1),
          WidgetContainer(color: color2),
          WidgetContainer(color: color3),
        ],
      ),
    );
  }
}

class WidgetContainer extends StatelessWidget {
  final Color color;
  const WidgetContainer({required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 150,
    );
  }
}
