import 'package:flutter/material.dart';
import 'package:ddplayer/view/player_page.dart';

class DDPlayer extends MaterialApp {
  const DDPlayer({Key? key})
      : super(
          key: key,
          home: const PlayerPage(),
        );
}
