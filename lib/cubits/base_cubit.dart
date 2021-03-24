// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:bloc/bloc.dart';

class KV<T> {
  final String name;
  T value;

  KV({required this.name, required this.value});
}

T getDefaultValue<T>(String name, T dflt) {
  final val = window.localStorage[name];
  if (val != null) {
    switch (T) {
      case String:
        return val as T;
      case int:
        return (int.tryParse(val) ?? 0) as T;
      case double:
        return (double.tryParse(val) ?? 0) as T;
      case bool:
        return (val == 'true') as T;
    }
  }
  window.localStorage[name] = dflt.toString();
  return dflt;
}

class DDCubit<T> extends Cubit<KV<T>> {
  final String name;

  DDCubit({required this.name, required T value})
      : super(KV(name: name, value: getDefaultValue(name, value)));

  void set(T value) {
    final name = state.name;
    window.localStorage[name] = value.toString();
    emit(KV(name: name, value: value));
  }

  T get value => state.value;
}
