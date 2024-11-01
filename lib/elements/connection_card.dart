import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_now_emulator/models/connection_model.dart';
import 'package:rest_now_emulator/screens/connection.dart';

class ConnectionCard extends StatelessWidget {
  final ConnectionModel model;

  const ConnectionCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final List<String> strings = [
      'Connection name',
      model.name,
      'Device UUID',
      model.UUID
    ];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Connection(model: model)));
      },
      child: Padding(
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
      ),
    );
  }
}
