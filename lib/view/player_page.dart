import 'package:ddplayer/components/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ddplayer/components/saving_throws.dart';
import 'package:ddplayer/components/head.dart';
import 'package:ddplayer/components/stats.dart';
import 'package:ddplayer/components/skills.dart';
import 'package:ddplayer/cubits/stats.dart';
import 'package:ddplayer/components/info.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    final page = Scaffold(
      appBar: AppBar(title: Text('Player')),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Head(),
            Status(),
            Stats(),
            SavingThrows(),
            Skills(),
            Info(),
          ],
        ),
      ),
    );

    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) => StrengthCubit()),
      BlocProvider(create: (BuildContext context) => SleightCibut()),
      BlocProvider(create: (BuildContext context) => PhysiqueCubit()),
      BlocProvider(create: (BuildContext context) => IntelligenceCubit()),
      BlocProvider(create: (BuildContext context) => WisdomCubit()),
      BlocProvider(create: (BuildContext context) => CharismaCubit()),
      BlocProvider(create: (BuildContext context) => MasterBonusCubit()),
    ], child: page);
  }
}
