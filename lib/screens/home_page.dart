import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_now_emulator/elements/list_of_connections.dart';
import 'package:rest_now_emulator/models/connection_model.dart';
// import 'package:rest_now_emulator/models/connection_model.dart';
import 'package:rest_now_emulator/providers/connection_provider.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('RestNow Controller Emulator'),
      ),
      body: const Center(
        child: Stack(
          children: [
            ListOfConnections(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ConnectionProvider>(context, listen: false).addConnection(
              ConnectionModel(
                  name: 'New Connection',
                  UUID: const Uuid().v1(),
              ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
