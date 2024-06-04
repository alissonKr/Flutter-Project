import 'package:flutter/material.dart';

class sliverAppBar extends StatefulWidget {
  const sliverAppBar({super.key});

  @override
  State<sliverAppBar> createState() => _sliverAppBarState();
}

class _sliverAppBarState extends State<sliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Row(
                children: [
                  Icon(Icons.star),
                  SizedBox(width: 8.0),
                  Text('Título da AppBar'),
                ],
              ),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

