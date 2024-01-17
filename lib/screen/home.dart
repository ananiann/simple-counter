import 'package:demo6/notifier/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                }),
          ),
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              }),
        ],
      ),
      appBar: AppBar(
        title: Center(
          child: Text('Counter'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Kamu telah menekan tombol sebanyak: '),
          ),
          Text(
            '${ref.watch(counterProvider)}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
