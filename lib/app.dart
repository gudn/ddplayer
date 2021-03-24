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

class StateSaver extends BlocObserver {
  @override
  void onChange(BlocBase cubit, Change change) {
    super.onChange(cubit, change);
    if (cubit is DDCubit) {
      final name = cubit.state.name;
      final value = cubit.state.value.toString();
      window.localStorage[name] = value;
    }
  }
}
