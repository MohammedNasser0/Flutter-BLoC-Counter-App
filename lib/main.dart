import 'package:flutter/material.dart';

import 'screens/phase_one_screen.dart';
import 'screens/listener_screen.dart';
import 'screens/builder_screen.dart';
import 'screens/consumer_screen.dart';
import 'screens/counter_screen.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLoC Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      ('Phase 1 - CounterBloc & ThemeBloc', const PhaseOneScreen()),
      ('Phase 2 - BlocListener', const ListenerScreen()),
      ('Phase 2 - BlocBuilder', const BuilderScreen()),
      ('Phase 2 - BlocConsumer', const ConsumerScreen()),
      ('Phase 3 - Complete Counter App', const CounterScreen()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Learning App')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: screens.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(screens[index].$1),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => screens[index].$2),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
