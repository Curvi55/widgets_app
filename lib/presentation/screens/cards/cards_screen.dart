import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {

  // esta propiedad name es para trabajar con go_router, es static porque no 
  // se quiere crear una instancia de esta clase solo para saber el nombre
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Screen'),       
      ),
      body: const Placeholder(),
    );
  }
}