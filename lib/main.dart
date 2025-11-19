import 'package:flutter/material.dart';
import 'package:myapp/controllers/sqflite_controller.dart';
import 'package:myapp/views/tela_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqfliteController().initDb();

  runApp(const ConversorMoedasApp());
}

class ConversorMoedasApp extends StatelessWidget {
  const ConversorMoedasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TelaLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}