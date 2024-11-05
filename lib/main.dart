import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:rest_now_emulator/bloc/connection_bloc.dart';
import 'package:rest_now_emulator/models/connection_model.dart';
import 'package:rest_now_emulator/providers/connection_provider.dart';
import 'package:rest_now_emulator/screens/connection.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:rest_now_emulator/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print('rebuild main');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConnectionProvider>(
            create: (context) => ConnectionProvider()),
        BlocProvider(
          create: (context) => ConnectionBloc(),
        ),
        // ChangeNotifierProvider<FocusProvider>(create: (context) => FocusProvider()),
      ],
      child: Consumer<ConnectionProvider>(
          builder: (context, ConnectionProvider notifier, child) {
            return const MaterialApp(
              home: HomePage(),
            );
          }),
    );
  }
}
