import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rest_now_emulator/elements/connection_card.dart';
import 'package:rest_now_emulator/models/connection_model.dart';
import 'package:rest_now_emulator/providers/connection_provider.dart';

class ListOfConnections extends StatelessWidget {
  const ListOfConnections({super.key});

  @override
  Widget build(BuildContext context) {
    Map<int, ConnectionModel> connections =
        Provider.of<ConnectionProvider>(context).connections;
    // List<Widget> listChildren = [];
    // connections.forEach((key, value) {
    //   listChildren.add(ConnectionCard(model: value));
    // });
    return ListView.builder(
      itemCount: connections.length,
      itemBuilder: (context, int index) => ConnectionCard(
        model: connections[index]!,
      ),
    );
  }
}
