import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_now_emulator/elements/connection_card.dart';
import 'package:rest_now_emulator/models/connection_model.dart';
import 'package:rest_now_emulator/providers/connection_provider.dart';

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
          ConnectionCard(
            model: model,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete_forever),
            label: 'Delete',
          ),
        ],
        onTap: (tapped) {
          debugPrint('TAP ON $tapped');
          switch (tapped) {
            case 1:
              Provider.of<ConnectionProvider>(context, listen: false)
                  .deleteConnectionByUUID(model.UUID);
              Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
