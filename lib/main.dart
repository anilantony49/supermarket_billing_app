import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:machine_task_atts/others/main_screen.dart';
import 'package:machine_task_atts/models/cart_models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   Hive.registerAdapter(CartModelsAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter app',
        home: MainScreen());
  }
}
