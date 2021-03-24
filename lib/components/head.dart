import 'package:flutter/material.dart';

import 'package:ddplayer/components/input.dart';
import 'package:ddplayer/cubits/base_cubit.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Input('Имя персонажа',
                cubit: DDCubit(name: 'имя персонажа', value: '')),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Input('Класс и уровень',
                          cubit: DDCubit(name: 'класс и уровень', value: '')),
                      Input('Предыстория',
                          cubit: DDCubit(name: 'предыстория', value: '')),
                      Input('Имя игрока',
                          cubit: DDCubit(name: 'имя игрока', value: ''))
                    ],
                  ),
                  Row(
                    children: [
                      Input('Раса', cubit: DDCubit(name: 'раса', value: '')),
                      Input('Мировоззрение',
                          cubit: DDCubit(name: 'мировоззрение', value: '')),
                      Input('Опыт', cubit: DDCubit(name: 'опыт', value: ''))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
