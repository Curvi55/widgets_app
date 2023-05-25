import 'package:flutter/material.dart';

// IMPORANTE AL EMPEZAR EL PROYECTO
// CORRER  en la terminal para inicializar el proyecto en el repositorio
/*
1. git init
2. git add .
3. git commit -m "first commit"
*/
// o desde el vs con view control source ctrl+shift +G
/* no es recomendable trabajar en la rama main, pero para saber donde estoy
poner en la terminal el command "git status"
en este caso nos vamos a mover a otra rama llamada 01-bases
para ello en la terminal escribimos el command "git checkout -b 01-bases"
al terminar todo unimos la rama 01-bases a la rama main (production) que es la final siempre.
si algo se daño y queremos volver a la ultima version de commit estable
usar el comando git checkout -- .
*/

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
