import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context){


    ScaffoldMessenger.of(context).clearSnackBars();  //este codigo solo para que halla un snack a la vez.

     final snackBar = SnackBar(
      content: const Text('Hola mundo!'),
      action: SnackBarAction(label: 'click me', onPressed: (){}),  // otras configuraciones de los snackbars
      duration:const  Duration(seconds: 2), // otro ejemplo de configuracion del snackbar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),

      floatingActionButton: 
        FloatingActionButton.extended(
          label: const Text('Mostrar snackabar'),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: ()=>showCustomSnackBar(context)),           
           
    );
  }
}
