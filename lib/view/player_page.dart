import 'dart:html';

import 'package:ddplayer/components/attacks.dart';
import 'package:ddplayer/components/big_field.dart';
import 'package:ddplayer/components/inventory.dart';
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

  Future<void> _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Delete all data?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              window.localStorage.clear();
              window.location.reload();
            },
            child: Text('Yes'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final page = Scaffold(
      appBar: AppBar(
        title: Text('Player'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showDialog(context),
          )
        ],
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Head(),
            Status(),
            Stats(),
            AttacksAndMagic(),
            SavingThrows(),
            Skills(),
            Inventory(),
            BigField(),
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
