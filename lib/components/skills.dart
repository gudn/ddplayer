import 'package:ddplayer/cubits/skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ddplayer/cubits/stats.dart';
import 'package:ddplayer/cubits/base_cubit.dart';

enum DepStat { strength, sleight, intelligence, wisdom, charisma }

const skillsList = {
  'Акробатика': DepStat.sleight,
  'Анализ': DepStat.intelligence,
  'Атлетика': DepStat.strength,
  'Выживание': DepStat.wisdom,
  'Выступление': DepStat.charisma,
  'Запугивание': DepStat.charisma,
  'История': DepStat.intelligence,
  'Ловкость рук': DepStat.sleight,
  'Магия': DepStat.intelligence,
  'Медицина': DepStat.wisdom,
  'Обман': DepStat.charisma,
  'Природа': DepStat.intelligence,
  'Проницательность': DepStat.wisdom,
  'Религия': DepStat.intelligence,
  'Скрытность': DepStat.sleight,
  'Убеждение': DepStat.charisma,
  'Уход за животными': DepStat.wisdom
};

MasterBonusCubit getMasterBonusCubit(BuildContext context) =>
    BlocProvider.of<MasterBonusCubit>(context);

class SkillCubit extends DDCubit<bool> {
  final String name;
  final StatCubit _statCubit;
  final MasterBonusCubit _masterBonusCubit;

  SkillCubit(this.name, BuildContext context)
      : _statCubit = getStatCubit(name, context),
        _masterBonusCubit = getMasterBonusCubit(context),
        super(name: 'skill-$name', value: false) {
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

  String get statName => _statCubit.state.name;

  int get skill {
    var result = _statCubit.modifier;
    if (value) result += _masterBonusCubit.value;
    return result;
  }

  static StatCubit getStatCubit(String name, BuildContext context) {
    final stat = skillsList[name];
    if (stat == null) throw ArgumentError('$name is invalid skill');
    switch (stat) {
      case DepStat.strength:
        return BlocProvider.of<StrengthCubit>(context);
      case DepStat.sleight:
        return BlocProvider.of<SleightCibut>(context);
      case DepStat.intelligence:
        return BlocProvider.of<IntelligenceCubit>(context);
      case DepStat.wisdom:
        return BlocProvider.of<WisdomCubit>(context);
      case DepStat.charisma:
        return BlocProvider.of<CharismaCubit>(context);
    }
  }
}

class Skills extends StatelessWidget {
  Widget buildInput(String name, BuildContext context) {
    final cubit = SkillCubit(name, context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => CheckboxListTile(
        title: Row(
          children: [
            Text('$name (${cubit.statName})'),
            Text(cubit.skill.toString())
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        value: cubit.value,
        onChanged: (bool? value) => cubit.set(value ?? false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final attentionCubit = AttentionCubit(context);
    return Card(
      child: Column(
        children: [
          Text(
            'Навыки',
            style: Theme.of(context).textTheme.headline4,
          ),
          for (final key in skillsList.keys) buildInput(key, context),
          BlocBuilder(
            bloc: attentionCubit,
            builder: (context, state) => CheckboxListTile(
              title: Row(
                children: [
                  Text('Внимательность (мудрость)'),
                  Text(attentionCubit.skill.toString())
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              value: attentionCubit.value,
              onChanged: (bool? value) => attentionCubit.set(value ?? false),
            ),
          )
        ],
      ),
    );
  }
}
