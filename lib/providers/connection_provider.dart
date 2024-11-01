import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:rest_now_emulator/models/connection_model.dart';

import 'package:uuid/uuid.dart';

class ConnectionProvider extends ChangeNotifier {
  final Map<int, ConnectionModel> _connections = {};
  int _lastId = 0;

  ConnectionProvider() {
    _initConnections();
  }

  void _initConnections(){
    _lastId = 0;
    _connections.putIfAbsent(
      _lastId++,
          () => ConnectionModel(name: 'Initial', UUID: const Uuid().v1()),
    );
  }

  Map<int, ConnectionModel> get connections => _connections;

  void addConnection(ConnectionModel connection) {
    _connections.putIfAbsent(
      _lastId++,
      () => ConnectionModel(name: connection.name, UUID: connection.UUID),
    );
    notifyListeners();
  }

  bool deleteConnection(int id) {
    if (_connections.containsKey(id)) {
      _connections.remove(id);
      notifyListeners();
      return true;
    }
    return false;
  }

  void deleteConnectionByUUID(String uuid) {
    _connections.forEach((key, value) {
      if (value.UUID == uuid) {
        _connections.remove(key);
        notifyListeners();
      }
    });
    if (_connections.isEmpty) {
      _initConnections();
    }
  }
}
