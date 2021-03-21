import 'package:flutter/material.dart';

import 'package:ddplayer/components/input.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Input('Имя персонажа'),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Input('Класс и уровень'),
                      Input('Предыстория'),
                      Input('Имя игрока')
                    ],
                  ),
                  Row(
                    children: [
                      Input('Раса'),
                      Input('Мировоззрение'),
                      Input('Опыт')
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
