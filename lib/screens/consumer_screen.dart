import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc.dart';

class ConsumerScreen extends StatelessWidget {
  const ConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('BlocConsumer')),
            body: BlocConsumer<CounterBloc, int>(
              listenWhen: (previous, current) =>
                  current == 10 || current == -10,
              listener: (context, counter) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Counter reached $counter')),
                );
              },
              builder: (context, counter) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Counter value'),
                      Text('$counter', style: const TextStyle(fontSize: 48)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<CounterBloc>().add(
                                DecrementCounter(),
                              );
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<CounterBloc>().add(
                                IncrementCounter(),
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
