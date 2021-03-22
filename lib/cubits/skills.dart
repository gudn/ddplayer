import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_cubit.dart';
import 'stats.dart';

class AttentionCubit extends DDCubit<bool> {
  final StatCubit _statCubit;
  final MasterBonusCubit _masterBonusCubit;

  AttentionCubit(BuildContext context)
      : _statCubit = BlocProvider.of<WisdomCubit>(context),
        _masterBonusCubit = BlocProvider.of<MasterBonusCubit>(context),
        super(name: 'Внимательность', value: false) {
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
