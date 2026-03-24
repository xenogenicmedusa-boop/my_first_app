import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Data model for the counter.
///
/// It extends [ChangeNotifier] to allow widgets to listen for changes
/// to the counter value.
class CounterData extends ChangeNotifier {
  /// The current count value.
  int _count;

  /// Initializes the counter with a starting value of 0.
  CounterData() : _count = 0;

  /// Getter to access the current count.
  int get count => _count;

  /// Increments the counter value by 1 and notifies listeners.
  void increment() {
    _count++;
    notifyListeners();
  }

  /// Decrements the counter value by 1 and notifies listeners.
  void decrement() {
    _count--;
    notifyListeners();
  }
}

/// The root widget of the application.
///
/// It sets up the [MaterialApp] and provides the [CounterData] using
/// [ChangeNotifierProvider].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '簡單計數器', // Simple Counter
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: ChangeNotifierProvider<CounterData>(
        create: (BuildContext context) => CounterData(),
        builder: (BuildContext context, Widget? child) {
          return const CounterScreen();
        },
      ),
    );
  }
}

/// The main screen widget for the counter application.
///
/// It displays the current count and provides buttons to increment
/// and decrement the count.
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('計數器'), // Counter
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '目前的計數:', // Current Count
              style: TextStyle(fontSize: 24),
            ),
            // Consumer listens to changes in CounterData and rebuilds its child
            // widget (the Text displaying the count) when the count changes.
            Consumer<CounterData>(
              builder: (BuildContext context, CounterData counterData, Widget? child) {
                return Text(
                  '${counterData.count}',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Button to decrement the count
                ElevatedButton.icon(
                  onPressed: () {
                    // Access CounterData without listening (listen: false)
                    // because we only need to call a method, not rebuild based on it.
                    Provider.of<CounterData>(context, listen: false).decrement();
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('減少'), // Decrease
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(width: 20),
                // Button to increment the count
                ElevatedButton.icon(
                  onPressed: () {
                    // Access CounterData without listening (listen: false)
                    Provider.of<CounterData>(context, listen: false).increment();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('增加'), // Increase
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}