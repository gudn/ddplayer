import 'base_cubit.dart';

class StatCubit extends DDCubit<int> {
  StatCubit(String name) : super(name: name, value: 0);

  int get modifier {
    return (super.value - 10) ~/ 2;
  }
}

class StrengthCubit extends StatCubit {
  StrengthCubit() : super('сила');
}

class SleightCibut extends StatCubit {
  SleightCibut() : super('ловкость');
}

class PhysiqueCubit extends StatCubit {
  PhysiqueCubit() : super('телосложение');
}

class IntelligenceCubit extends StatCubit {
  IntelligenceCubit() : super('интеллект');
}

class WisdomCubit extends StatCubit {
  WisdomCubit() : super('мудрость');
}

class CharismaCubit extends StatCubit {
  CharismaCubit() : super('харизма');
}

class MasterBonusCubit extends DDCubit<int> {
  MasterBonusCubit() : super(name: 'бонус мастерства', value: 2);
}
