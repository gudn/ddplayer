import 'package:ddplayer/components/head.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(title: Text('Player')),
        body: Column(
          children: [Head()],
        ));
  }
}
