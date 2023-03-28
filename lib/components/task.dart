import 'package:alura/components/difficulty.dart';
import 'package:flutter/material.dart';

class task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {
  int clicks = 0;
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          colorChange(clicks),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            )),
                        Difficulty(
                          difficultyLevel: widget.dificuldade,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              clicks++;
                              nivel++;
                              if (((nivel / widget.dificuldade) / 10 >= 1)) {
                                nivel = 0;
                              }
                            });
                            print(clicks);
                            //print(nivel);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nivel $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class colorChange extends StatelessWidget {
  Container ateDez() {
    return Container(
      /*blue,green,yellow,orange,red,purple,black*/
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ((clicks < 10
              ? Colors.blue
              : clicks > 20
                  ? Colors.green
                  : clicks > 30
                      ? Colors.yellow
                      : clicks > 40
                          ? Colors.black
                          : Colors.cyanAccent))),
      height: 140,
    );
  }

  int clicks;
  colorChange(this.clicks, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /*blue,green,yellow,orange,red,purple,black*/
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ((clicks < 10
              ? Colors.blue
              : clicks > 20
                  ? Colors.green
                  : clicks > 30
                      ? Colors.yellow
                      : clicks > 40
                          ? Colors.black
                          : Colors.cyanAccent))),
      height: 140,
    );
  }
}
