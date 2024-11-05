import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import 'package:rest_now_emulator/bloc/connection_bloc.dart';
import 'package:rest_now_emulator/elements/confirm_cancel_buttons.dart';
import 'package:rest_now_emulator/elements/connection_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_now_emulator/providers/connection_provider.dart';

class Connection extends StatelessWidget {
  final int id;
  final flutterReactiveBle = FlutterReactiveBle();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController uuidController = TextEditingController();
  final double baseSize = 20.0;

  Connection({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.red;
    Color iconColor = Colors.grey;
    IconData statusIcon = Icons.bluetooth_disabled;
    const double insets = 5.0;
    final model = Provider.of<ConnectionProvider>(context).getModel(id);

    void editDone() {
      if (nameController.text != model.name || uuidController.text != model.UUID) {
        model.name = nameController.text;
        model.UUID = uuidController.text;
        Provider.of<ConnectionProvider>(context, listen: false)
            .updateModel(id, model);
      }
      Navigator.pop(context);
    }

    nameController.text = model.name;
    uuidController.text = model.UUID;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(model.name),
      ),
      body: ListView(
        children: [
          BlocConsumer<ConnectionBloc, BleConnectionState>(
            listener: (context, state) {
              if (state is ActivatedState) {
                statusColor = Colors.greenAccent;
                statusIcon = Icons.bluetooth_connected;
                iconColor = Colors.blueAccent;
              } else if (state is PausedState) {
                statusColor = Colors.grey;
                statusIcon = Icons.bluetooth;
                iconColor = Colors.blueGrey;
              }
            },
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(insets),
                color: statusColor,
                child: Row(
                  children: [
                    Icon(
                      statusIcon,
                      color: iconColor,
                    ),
                    const Text('Status'),
                  ],
                ),
              );
            },
          ),
          ConnectionCard(index: id),
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
            case 0:
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    contentPadding: EdgeInsets.all(baseSize / 2),
                    title: const Text(
                      'Edit connection',
                      textAlign: TextAlign.center,
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: baseSize / 2),
                        child: const Text('Name'),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          focusColor: Colors.red,
                        ),
                        onEditingComplete: () => editDone(),
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        controller: nameController,
                        maxLines: 1,
                        minLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: baseSize / 2),
                        child: const Text('UUID'),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          focusColor: Colors.red,
                        ),
                        onEditingComplete: () => editDone(),
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        controller: uuidController,
                        maxLines: 1,
                        minLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: baseSize),
                        child: ConfirmCancelButtons(
                          confirmCallback: () => editDone(),
                          cancelCallback: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  );
                },
              );
              break;
            case 1:
              Provider.of<ConnectionProvider>(context, listen: false)
                  .deleteConnection(id);
              Navigator.of(context).pop();
              break;
          }
        },
      ),
    );
  }
}
