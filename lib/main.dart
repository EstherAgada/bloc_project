import 'package:bloc_project/counter/bloc.dart';
import 'package:bloc_project/counter/bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      home: BlocProvider(create: (context) => CounterBloc(), child: HomePage()),
    ),
  );
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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: const Text('Current Value:')),
              ),
              Center(
                child: const Text(
                  '12',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w400,
                    color: Colors.purple,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Even Number'),
                  ),
                ),
              ),

              Divider(
                thickness: 0.5, // Makes the line very thin
                color: Colors.black.withValues(
                  alpha: 0.2,
                ), // Makes the line semi-transparent
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Change by:'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  // Open the numeric keyboard layout on mobile devices
                  keyboardType: TextInputType.number,

                  //  Force the field to strictly accept only digits (0-9)
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),

                  onChanged: (value) {
                    try {} catch (_) {}
                  },
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 20,
                      ),
                      backgroundColor: Colors.purple.shade400,
                    ),

                    child: const Text(
                      'Increase',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      backgroundColor: const Color.fromARGB(255, 212, 22, 183),
                    ),

                    child: const Text(
                      'Decrease',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 52,
                        vertical: 20,
                      ),
                      backgroundColor: Colors.blue.shade300,
                    ),

                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 20,
                      ),
                      backgroundColor: const Color.fromARGB(255, 223, 151, 56),
                    ),

                    child: const Text(
                      'Clear input',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'About',

                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const Text(
                          'Increase or decrease the current value by the number you input above.',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
