import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app_cubits_bloc/presentation/bloc/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void increaseBy(BuildContext context, int value) {
    context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc bloc) => Text("Bloc Counter transaction: ${bloc.state.transactionCount}")),
        actions: [
          IconButton(icon: const Icon(Icons.refresh_rounded), onPressed: () {
            context.read<CounterBloc>().reset();
          }),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc bloc) =>
              Text("Bloc Counter Value: ${bloc.state.counter}"),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            child: Text('+3'),
            onPressed: () {increaseBy(context, 3);},
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: "2",
            child: Text('+2'),
            onPressed: () {increaseBy(context, 2);},
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: "3",
            child: Text('+1'),
            onPressed: () {increaseBy(context, 1);},
          ),
        ],
      ),
    );
  }
}
