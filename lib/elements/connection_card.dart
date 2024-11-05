
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_now_emulator/models/connection_model.dart';
import 'package:rest_now_emulator/providers/connection_provider.dart';

class ConnectionCard extends StatelessWidget {
  final int index;

  const ConnectionCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final ConnectionModel model = Provider.of<ConnectionProvider>(context).getModel(index);
    final List<String> strings = [
      'Connection name',
      model.name,
      'Device UUID',
      model.UUID
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        children: [
          for (int i = 0; i < strings.length; i++)
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              color: i.isEven ? Colors.black38 : Colors.black12,
              child: Text(strings[i]),
            ),
        ],
      ),
    );
  }
}
