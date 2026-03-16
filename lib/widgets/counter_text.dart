import 'package:flutter/material.dart';
import '../providers/counter_provider.dart'; 
import 'package:provider/provider.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<CounterProvider>().count.toString(),
      style: const TextStyle(fontSize: 30),  
    );
  }
}