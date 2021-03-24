import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ddplayer/view/player_page.dart';
import 'package:ddplayer/cubits/base_cubit.dart';

class DDPlayer extends MaterialApp {
  const DDPlayer({Key? key})
      : super(
          key: key,
          home: const PlayerPage(),
        );
}
