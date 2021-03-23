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
                Input('ММ'),
                Input('СМ'),
                Input('ЭМ'),
                Input('ЗМ'),
                Input('ПМ'),
              ],
            ),
            Input('Снаряжение', expanded: false, multiline: true)
          ],
        ),
      ),
    );
  }
}
