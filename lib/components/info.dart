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
            Input('Прочие владения и языки', expanded: false, multiline: true),
            Input('Черты характера', expanded: false, multiline: true),
            Input('Идеалы', expanded: false, multiline: true),
            Input('Привязанности', expanded: false, multiline: true),
            Input('Слабости', expanded: false, multiline: true),
          ],
        ),
      ),
    );
  }
}
