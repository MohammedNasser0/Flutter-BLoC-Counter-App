import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc.dart';
import '../blocs/theme_bloc.dart';

class PhaseOneScreen extends StatelessWidget {
  const PhaseOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, isDark) {
          return Theme(
            data: isDark ? ThemeData.dark() : ThemeData.light(),
            child: Builder(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Phase 1 - BLoC'),
                    actions: [
                      IconButton(
                        onPressed: () {
                          context.read<ThemeBloc>().add(ToggleTheme());
                        },
                        icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                      ),
                    ],
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('CounterBloc'),
                        BlocBuilder<CounterBloc, int>(
                          builder: (context, counter) {
                            return Text(
                              '$counter',
                              style: const TextStyle(fontSize: 40),
                            );
                          },
                        ),
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
                        const SizedBox(height: 24),
                        const Text('ThemeBloc'),
                        Text(isDark ? 'Dark Mode' : 'Light Mode'),
                      ],
                    ),
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
