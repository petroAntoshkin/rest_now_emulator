
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_now_emulator/elements/connection_card.dart';
import 'package:rest_now_emulator/providers/connection_provider.dart';
import 'package:rest_now_emulator/screens/connection.dart';

class ListOfConnections extends StatelessWidget {
  const ListOfConnections({super.key});

  @override
  Widget build(BuildContext context) {
    var listOfId = Provider.of<ConnectionProvider>(context).modelIds;
    return ListView.builder(
      itemCount: listOfId.length,
      itemBuilder: (context, int index) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Connection(id: index)));
        },
        child: ConnectionCard(index: index),
      ),
    );
  }
}
