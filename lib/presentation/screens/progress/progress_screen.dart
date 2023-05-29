import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Progress Indicators')),
      body: const _ProgressView(),  
    );
  }
}

class _ProgressView extends StatelessWidget {
  
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
          children: [
            SizedBox(height:30),
            Text('Circular Progerss indicator basic'),
            SizedBox(height:10),
            CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.black45, ),
            SizedBox(height:20),
            Text('Circular y Lineal controlado'),
            SizedBox(height: 10),
             __ControlledProgressIndicator()
          ],
        ),
      );
  }
}

// vamos a crear un widget nuevo para el widget de Circulado controlado
class __ControlledProgressIndicator  extends StatelessWidget {
  const __ControlledProgressIndicator();
  @override
  Widget build(BuildContext context) {
    
    //notese que la declaracion original tiene <Object>, return StreamBuilder<Object>,  lo cual ha siso removido en la declaracion de abajo
    return StreamBuilder(  //stream builder algo que se va a construir en tiempo de ejecución en base a un stream
      //stream: null,  // entiendase stream como un flujo de información
      //ahora definimos el stream
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
         return (value * 2)/100;  // esto es lo que hacemos en el flujo en tiempo de ejecución
      } ).takeWhile((value)=> value  <= 100),

      builder: (context, snapshot) { // este builder va asociado al stream, se ejecuta cada 300 ms

        // esta data del snapshot es equivalente al value del stream
        final progressValue = snapshot.data ?? 0;  // si esta en nulo asigne 0


        return  Padding(
          // metemos un padding para que no quede muy pegado, espacio en las 4 direcciones
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //nota value es un valor entre 0.0 y 1.0  ~ 100%
              CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black45, ),
              const SizedBox(width: 20,), // notese el uso de width, estamos en un row no en una columna
              //vamos a usar el LinearProgressIndicator pero hay que decirle su canvas, sino da error, porque no sabe donde va a pintar, para eso se usa Expanded
              Expanded(
                child: LinearProgressIndicator(value: progressValue,)
                )
    
    
            ],
    
            ),
          );
      }
    );
  }

}