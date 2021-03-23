import 'package:ddplayer/components/input.dart';
import 'package:flutter/material.dart';

class ExtraInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            'Прочие владения и языки',
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Input(
              'Прочие владения и языки',
              expanded: false,
              multiline: true,
            ),
          )
        ],
      ),
    );
  }
}
