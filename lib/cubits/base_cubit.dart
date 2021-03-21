import 'package:bloc/bloc.dart';

class KV<T> {
  final String name;
  T value;

  KV({required this.name, required this.value});
}

class DDCubit<T> extends Cubit<KV<T>> {
  final String name;

  DDCubit({required this.name, required T value})
      : super(KV(name: name, value: value));

  void set(T value) {
    emit(KV(name: this.name, value: value));
  }

  T get value => state.value;
}
