import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    print('full rebuild');
    return Consumer<CounterModel>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'click any to increase:',
                  ),
                  Text(
                    value.count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/bmiCalculator');
                    },
                    child: const Text('BMI CALCULATOR'),
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    final counter = context.read<CounterModel>();
                    counter.incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ), // This trailing comma makes auto-formatting nicer for build methods.
                FloatingActionButton(
                  onPressed: () {
                    final counter = context.read<CounterModel>();
                    counter.decrementCounter();
                  },
                  tooltip: 'decrement',
                  child: const Icon(Icons.exposure_minus_1),
                ), // This trailing comma makes auto-formatting nicer for build methods.
              ],
            )));
  }
}
