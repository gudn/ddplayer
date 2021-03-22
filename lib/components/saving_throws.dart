import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ddplayer/cubits/stats.dart';
import 'package:ddplayer/cubits/base_cubit.dart';

class SavingCubit<T extends StatCubit> extends DDCubit<bool> {
  final String name;
  final T _statCubit;
  final MasterBonusCubit _masterBonusCubit;

  SavingCubit(this.name, BuildContext context)
      : _statCubit = BlocProvider.of<T>(context),
        _masterBonusCubit = BlocProvider.of<MasterBonusCubit>(context),
        super(name: 'savingthrows-$name', value: false) {
    _statCubit.stream.listen((_) {
      final curr = value;
      set(!curr);
      set(curr);
    });
    _masterBonusCubit.stream.listen((_) {
      final curr = value;
      set(!curr);
      set(curr);
    });
  }

  int get skill {
    var result = _statCubit.modifier;
    if (value) result += _masterBonusCubit.value;
    return result;
  }
}

class SavingThrows extends StatelessWidget {
  Widget buildInput<T extends StatCubit>(String name, BuildContext context) {
    final cubit = SavingCubit<T>(name, context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => CheckboxListTile(
        title: Row(
          children: [Text('$name'), Text(cubit.skill.toString())],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        value: cubit.value,
        onChanged: (bool? value) => cubit.set(value ?? false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('Спас-броски', style: Theme.of(context).textTheme.headline4),
          buildInput<StrengthCubit>('Сила', context),
          buildInput<SleightCibut>('Ловкость', context),
          buildInput<PhysiqueCubit>('Телосложение', context),
          buildInput<IntelligenceCubit>('Интеллект', context),
          buildInput<WisdomCubit>('Мудрость', context),
          buildInput<CharismaCubit>('Харизма', context),
        ],
      ),
    );
  }
}
