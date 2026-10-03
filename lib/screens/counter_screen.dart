import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter BLoC Counter'),
        centerTitle: true,
      ),
      body: BlocListener<CounterCubit, int>(
        listenWhen: (previous, current) => previous >= 0 && current < 0,
        listener: (context, counter) {
          showDialog<void>(
            context: context,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('Negative Counter'),
                content: Text('The counter is now $counter.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: BlocConsumer<CounterCubit, int>(
          listenWhen: (previous, current) => current == 10 || current == -10,
          listener: (context, counter) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  counter == 10
                      ? 'Congratulations! Counter reached 10.'
                      : 'Counter reached -10.',
                ),
              ),
            );
          },
          builder: (context, counter) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.exposure_plus_1,
                      size: 64,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Current Counter',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '$counter',
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<CounterCubit>().decrement();
                          },
                          icon: const Icon(Icons.remove),
                          label: const Text('Decrement'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<CounterCubit>().increment();
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Increment'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        context.read<CounterCubit>().reset();
                      },
                      child: const Text('Reset Counter'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
