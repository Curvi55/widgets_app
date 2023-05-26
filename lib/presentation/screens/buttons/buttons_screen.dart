import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {


  // esta propiedad name es para trabajar con go_router, es static porque no 
  // se quiere crear una instancia de esta clase solo para saber el nombre
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),       
      ),
      body: const Placeholder(),
    );
  }
}