import 'package:flutter/material.dart';

import 'package:ddplayer/components/input.dart';

class BigField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Умения и особенности',
                style: Theme.of(context).textTheme.headline4),
            Input(
              'Умения и особенности',
              expanded: false,
              multiline: true,
            ),
          ],
        ),
      ),
    );
  }
}
