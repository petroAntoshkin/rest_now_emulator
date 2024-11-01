import 'package:flutter/material.dart';
import 'package:rest_now_emulator/models/connection_model.dart';
import 'package:rest_now_emulator/providers/connection_provider.dart';
import 'package:rest_now_emulator/screens/connection.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:rest_now_emulator/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        // ChangeNotifierProvider<FocusProvider>(create: (context) => FocusProvider()),
      ],
      child: Consumer<ConnectionProvider>(
          builder: (context, ConnectionProvider notifier, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              // title: 'Least Squares',
              home: HomePage(),
            );
          }),
    );
  }
}
