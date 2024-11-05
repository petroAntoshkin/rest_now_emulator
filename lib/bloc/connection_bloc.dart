
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connection_event.dart';
part 'ble_connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, BleConnectionState> {
  ConnectionBloc() : super(const ConnectionInitial()) {
    on<ConnectionActivated>((event, emit) {
      emit(const ActivatedState(Statuses.activated));
    });
    on<ConnectionPaused>((event, emit) {
      emit(const PausedState(Statuses.paused));
    });
  }

}

