import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ddplayer/components/head.dart';
import 'package:ddplayer/components/stats.dart';
import 'package:ddplayer/cubits/stats.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    final page = Scaffold(
      appBar: AppBar(title: Text('Player')),
      body: Column(
        children: [Head(), Stats()],
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
