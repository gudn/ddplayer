import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ddplayer/app.dart';

void main() {
  Bloc.observer = StateSaver();
  runApp(DDPlayer());
}
