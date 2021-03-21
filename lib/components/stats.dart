import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ddplayer/components/input.dart';
import 'package:ddplayer/cubits/stats.dart';

class StatInput extends StatelessWidget {
  final String label;
  final StatCubit cubit;

  StatInput(this.label, this.cubit);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Input(label, cubit: cubit),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0, 0, 4.0),
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, _) => Text('Мод. ${cubit.modifier}'),
          ),
        )
      ],
    );
  }
}

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final masterBonus = Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Input(
        'Бонус мастерства',
        cubit: BlocProvider.of<MasterBonusCubit>(context),
        expanded: false,
      ),
    ));
    final stats = Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            StatInput('Сила', BlocProvider.of<StrengthCubit>(context)),
            StatInput('Ловкость', BlocProvider.of<SleightCibut>(context)),
            StatInput('Телосложение', BlocProvider.of<PhysiqueCubit>(context)),
            StatInput('Интеллект', BlocProvider.of<IntelligenceCubit>(context)),
            StatInput('Мудрость', BlocProvider.of<WisdomCubit>(context)),
            StatInput('Харизма', BlocProvider.of<CharismaCubit>(context)),
          ],
        ),
      ),
    );

    return Column(children: [masterBonus, stats]);
  }
}
