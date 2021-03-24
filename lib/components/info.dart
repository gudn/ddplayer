import 'package:ddplayer/cubits/base_cubit.dart';
import 'package:flutter/material.dart';

import 'package:ddplayer/components/input.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Информация',
              style: Theme.of(context).textTheme.headline4,
            ),
            Input(
              'Прочие владения и языки',
              expanded: false,
              multiline: true,
              cubit: DDCubit(name: 'прочие владения и языки', value: ''),
            ),
            Input(
              'Черты характера',
              expanded: false,
              multiline: true,
              cubit: DDCubit(name: 'черты характера', value: ''),
            ),
            Input(
              'Идеалы',
              expanded: false,
              multiline: true,
              cubit: DDCubit(name: 'идеалы', value: ''),
            ),
            Input(
              'Привязанности',
              expanded: false,
              multiline: true,
              cubit: DDCubit(name: 'привязанности', value: ''),
            ),
            Input(
              'Слабости',
              expanded: false,
              multiline: true,
              cubit: DDCubit(name: 'слабости', value: ''),
            ),
          ],
        ),
      ),
    );
  }
}
