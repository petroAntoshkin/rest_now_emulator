
part of 'connection_bloc.dart';

abstract class ConnectionEvent {}

class ConnectionActivated extends ConnectionEvent {}

class ConnectionPaused extends ConnectionEvent {}