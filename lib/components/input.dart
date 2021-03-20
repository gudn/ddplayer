import 'package:ddplayer/base_cubit.dart';
import 'package:flutter/material.dart';

class Input<T> extends StatelessWidget {
  final String label;
  final DDCubit<T>? cubit;

  Input(this.label, {this.cubit});

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(labelText: label);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextField(
          decoration: decoration,
        ),
      ),
    );
  }
}
