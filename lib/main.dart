import 'package:flutter/material.dart';

// IMPORANTE AL EMPEZAR EL PROYECTO
// CORRER  en la terminal para inicializar el proyecto en el repositorio
/*
1. git init
2. git add .
3. git commit -m "first commit"
*/
// o desde el vs con view control source ctrl+shift +G

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
