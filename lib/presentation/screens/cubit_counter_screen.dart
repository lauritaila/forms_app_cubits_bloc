import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app_cubits_bloc/presentation/bloc/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseBy(BuildContext context, int value) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit cubit) => Text("Cubits Transactions : ${cubit.state.transactionCount}")),
        actions: [
          IconButton(icon: const Icon(Icons.refresh_rounded), onPressed: () {
            context.read<CounterCubit>().reset();
          }),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) {
            return Text("Cubit Counter Value: ${state.counter}");
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            child: Text('+3'),
            onPressed: () => increaseBy(context, 3),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: "2",
            child: Text('+2'),
            onPressed: () => increaseBy(context, 2),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: "3",
            child: Text('+1'),
            onPressed: () => increaseBy(context, 1),
          ),
        ],
      ),
    );
  }
}
