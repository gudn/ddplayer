import 'base_cubit.dart';

class StatCubit extends DDCubit<int> {
  StatCubit(String name) : super(name: name, value: 0);

  int get modifier {
    return (super.value - 10) ~/ 2;
  }
}

class StrengthCubit extends StatCubit {
  StrengthCubit() : super('strength');
}

class SleightCibut extends StatCubit {
  SleightCibut() : super('sleight');
}

class PhysiqueCubit extends StatCubit {
  PhysiqueCubit() : super('physique');
}

class IntelligenceCubit extends StatCubit {
  IntelligenceCubit() : super('intelligence');
}

class WisdomCubit extends StatCubit {
  WisdomCubit() : super('wisdom');
}

class CharismaCubit extends StatCubit {
  CharismaCubit() : super('charisma');
}
