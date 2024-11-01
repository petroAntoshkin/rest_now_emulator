import 'package:flutter/material.dart';
import 'package:rest_now_emulator/models/connection_model.dart';

class Connection extends StatelessWidget {
  final ConnectionModel model;
  const Connection({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    const double insets = 5.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(model.name),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(insets),
            color: Colors.red,
            child: Text('Status'),
          ),
          Container(
            padding: const EdgeInsets.all(insets),
            child: const Text('DEVICE UUID'),
          )
        ],
      ),
    );
  }
}
