import 'package:flutter/material.dart';
import 'package:myapp/controllers/sqflite_controller.dart';
import 'package:myapp/views/tela_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqfliteController().initDb();

  runApp(ConversorMoedasApp());
}

class ConversorMoedasApp extends StatelessWidget {
  const ConversorMoedasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Conversor de Moedas")),
          backgroundColor: const Color.fromARGB(255, 255, 157, 19),
        ),
        body: const TelaLogin(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}