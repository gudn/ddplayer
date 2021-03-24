import 'package:ddplayer/cubits/base_cubit.dart';
import 'package:flutter/material.dart';

class Input<T> extends StatelessWidget {
  final String label;
  final DDCubit<T> cubit;
  final TextEditingController _controller;
  final bool expanded, multiline;

  Input(this.label,
      {required this.cubit, this.expanded = true, this.multiline = false})
      : _controller = TextEditingController(text: cubit.value.toString()) {
    _controller.addListener(() {
      if (_controller.text.length == 0) return;
      switch (T) {
        case int:
          cubit.set((int.tryParse(_controller.text) ?? 0) as T);
          break;
        case double:
          cubit.set((double.tryParse(_controller.text) ?? 0) as T);
          break;
        case String:
          cubit.set(_controller.text as T);
          break;
        default:
          throw TypeError();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(labelText: label);
    var keyboardType = TextInputType.text;
    switch (T) {
      case int:
        keyboardType = TextInputType.number;
        break;
    }
    if (multiline) keyboardType = TextInputType.multiline;

    final child = Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        decoration: decoration,
        keyboardType: keyboardType,
        controller: _controller,
        minLines: 1,
        maxLines: null,
      ),
    );
    if (expanded) return Expanded(child: child);
    return child;
  }
}
