import 'dart:html';

import 'package:bloc/bloc.dart';

class KV<T> {
  final String name;
  T value;

  KV({required this.name, required this.value});
}

class DDCubit<T> extends Cubit<KV<T>> {
  final String name;

  DDCubit({required this.name, required T value})
      : super(KV(name: name, value: value)) {
    final val = window.localStorage[name];
    if (val != null) {
      switch (T) {
        case String:
          set(val as T);
          break;
        case int:
          set((int.tryParse(val) ?? 0) as T);
          break;
        case double:
          set((double.tryParse(val) ?? 0) as T);
          break;
      }
      window.localStorage[name] = val;
    }
  }

  void set(T value) {
    emit(KV(name: this.name, value: value));
  }

  T get value => state.value;
}
