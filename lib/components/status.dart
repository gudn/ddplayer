import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ddplayer/components/input.dart';
import 'package:ddplayer/cubits/stats.dart';

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('Текущий статус', style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 98,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StatusInput('КД'),
                  InitiativeWidget(),
                  StatusInput('Скорость'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Хиты', style: Theme.of(context).textTheme.headline6),
                    Input('Максимум хитов', expanded: false),
                    Input('Текущие хиты', expanded: false),
                    Input('Временные хиты', expanded: false),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Кость хитов',
                              style: Theme.of(context).textTheme.headline6),
                          Input('Итого', expanded: false),
                          Input('Кость хитов', expanded: false),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Спас-броски от сметри',
                              style: Theme.of(context).textTheme.headline6),
                          Input('Успехи', expanded: false),
                          Input('Провалы', expanded: false),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InitiativeWidget extends StatelessWidget {
  const InitiativeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sleightCubit = BlocProvider.of<SleightCibut>(context);
    return Expanded(
      child: Card(
          elevation: 2.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlocBuilder(
                bloc: sleightCubit,
                builder: (context, state) => Text(
                    sleightCubit.modifier.toString(),
                    style: Theme.of(context).textTheme.headline6),
              ),
              Text('Инициатива', style: Theme.of(context).textTheme.subtitle1)
            ],
          )),
    );
  }
}

class StatusInput extends StatelessWidget {
  final String label;

  const StatusInput(
    this.label, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2.0,
        child: Column(
          children: [
            Input(label, expanded: false),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(label, style: Theme.of(context).textTheme.subtitle1),
            )
          ],
        ),
      ),
    );
  }
}
