
part of 'connection_bloc.dart';

enum Statuses{ await, activated, paused }

class BleConnectionState extends Equatable {
  final Statuses connectionStatus;
  const BleConnectionState({required this.connectionStatus});

  @override
  List<Object> get props => [connectionStatus];


  Map<String, dynamic> toMap() {
    return {
      'connectionStatus': connectionStatus,
    };
  }

  factory BleConnectionState.fromMap(Map<String, dynamic> map) {
    return BleConnectionState(
      connectionStatus: map['connectionStatus'] ?? Statuses.await,
    );
  }

}

class ConnectionInitial extends BleConnectionState{
  const ConnectionInitial():super(connectionStatus: Statuses.await);
}

class ActivatedState extends BleConnectionState {
  const ActivatedState(Statuses connectionStatus) : super(connectionStatus: Statuses.activated);
}

class PausedState extends BleConnectionState {
  const PausedState(Statuses connectionStatus) : super(connectionStatus: Statuses.paused);
}