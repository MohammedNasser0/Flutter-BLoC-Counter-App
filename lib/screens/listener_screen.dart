import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc.dart';

class ListenerScreen extends StatelessWidget {
  const ListenerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('BlocListener')),
            body: BlocListener<CounterBloc, int>(
              listenWhen: (previous, current) => current == 5,
              listener: (context, counter) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Counter reached 5!')),
                );
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Increase the counter to 5'),
                    const SizedBox(height: 16),
                    BlocBuilder<CounterBloc, int>(
                      builder: (context, counter) {
                        return Text(
                          '$counter',
                          style: const TextStyle(fontSize: 40),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: const Text('Increment'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
