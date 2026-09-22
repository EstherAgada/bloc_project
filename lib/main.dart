import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc Counter',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          children: [
            const Text('Current value'),
            const Text(
              '0',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                height: 5.5,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Text('Reset'),
                ),

                FloatingActionButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Clear input'),
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

abstract class CounterState {
  final int counterValue;
  const CounterState({required this.counterValue});
}

class IncrementEvent extends CounterState {
  const IncrementEvent() : super(counterValue: 1);
}

class DecrementEvent extends CounterState {
  const DecrementEvent() : super(counterValue: -1);
}

class ResetEvent extends CounterState {
  const ResetEvent() : super(counterValue: 0);
}

class ClearInputEvent extends CounterState {
  const ClearInputEvent() : super(counterValue: 0);
}
