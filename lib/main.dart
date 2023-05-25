import 'package:flutter/material.dart';

// IMPORANTE AL EMPEZAR EL PROYECTO
// CORRER git init en la terminal para inicializar el proyecto en el repositorio

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
