import 'package:ddplayer/cubits/base_cubit.dart';
import 'package:flutter/material.dart';

import 'package:ddplayer/components/input.dart';

class Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Снаряжение', style: Theme.of(context).textTheme.headline4),
            Row(
              children: [
                Input('ММ', cubit: DDCubit(name: 'мм', value: 0)),
                Input('СМ', cubit: DDCubit(name: 'см', value: 0)),
                Input('ЭМ', cubit: DDCubit(name: 'эм', value: 0)),
                Input('ЗМ', cubit: DDCubit(name: 'зм', value: 0)),
                Input('ПМ', cubit: DDCubit(name: 'пм', value: 0)),
              ],
            ),
            Input('Снаряжение',
                expanded: false,
                multiline: true,
                cubit: DDCubit(name: 'снаряжение', value: ''))
          ],
        ),
      ),
    );
  }
}
