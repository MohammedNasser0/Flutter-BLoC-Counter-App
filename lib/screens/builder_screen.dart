import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('BlocBuilder')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Counter value'),
                  BlocBuilder<CounterBloc, int>(
                    builder: (context, counter) {
                      return Text(
                        '$counter',
                        style: const TextStyle(fontSize: 48),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementCounter());
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementCounter());
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
