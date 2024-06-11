import 'package:flutter/material.dart';
import 'package:hvac/core/app_router.dart';
import 'package:hvac/core/database/app_database.dart';

late AppDatabase database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
    );
  }
}
