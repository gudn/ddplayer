import 'package:flutter/material.dart';

import 'package:ddplayer/components/input.dart';

class AttacksAndMagic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Атаки и заклинания',
                style: Theme.of(context).textTheme.headline4),
            Weapon(),
            Weapon(),
            Weapon(),
            Input('Атаки и заклинания', expanded: false, multiline: true)
          ],
        ),
      ),
    );
  }
}

class Weapon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Input('Название'),
            Input('Бонус атаки'),
            Input('Урон/Вид'),
          ],
        ),
      ),
    );
  }
}
