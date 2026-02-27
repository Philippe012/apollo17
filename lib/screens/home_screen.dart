import 'package:flutter/material.dart';
import 'package:hello_world/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider Example")),
      body: Center(
        child: Text(
          context.watch<CounterProvider>().count.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}