import 'package:ddplayer/cubits/base_cubit.dart';
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
            Weapon(0),
            Weapon(1),
            Weapon(2),
            Input('Атаки и заклинания',
                expanded: false,
                multiline: true,
                cubit: DDCubit(name: 'атаки и заклинания', value: ''))
          ],
        ),
      ),
    );
  }
}

class Weapon extends StatelessWidget {
  final int i;

  Weapon(this.i, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Input('Название', cubit: DDCubit(name: 'w$i-название', value: '')),
            Input('Бонус атаки',
                cubit: DDCubit(name: 'w$i-бонус атаки', value: 0)),
            Input('Урон/Вид', cubit: DDCubit(name: 'w$i-урон вид', value: '')),
          ],
        ),
      ),
    );
  }
}
