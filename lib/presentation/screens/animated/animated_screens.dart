//notese la importacion de math, para usar funciones matematicas
// solo me interesa el Random para este contexto
import 'dart:math' show Random;
import 'package:flutter/material.dart';


//para hacer la animación se convirtio de StatelessWidget a StatefulWidget
// con esto vamos a tener un widget que mantenga un estado basico
class AnimatedScreens  extends StatefulWidget {

  static const name= 'animated_screen';

  const AnimatedScreens({super.key});

  @override
  State<AnimatedScreens> createState() => _AnimatedScreensState();
}


class _AnimatedScreensState extends State<AnimatedScreens> {

  double width= 50;
  double height= 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;
  

  // metodo para generar animaciones
  void changeShape() {

    final random = Random();

    width = random.nextInt(200)+120;
    height = random.nextInt(200)+120;
    color = Color.fromRGBO( random.nextInt(255),random.nextInt(255), random.nextInt(255), 1);
    borderRadius = random.nextInt(100)+20;

    setState(() {
      
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated screen'),
      ),  

      body: Center(
        child:AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          //curve: Curves.easeOutCubic,
          curve: Curves.easeInExpo,
          //width: width, para prevenir que nos tire un valor menor a 0
          width: width <= 0 ? 0  : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius<0 ?0:borderRadius)
            )
          ,)
         ),

      floatingActionButton: FloatingActionButton(
        // onPressed: ()=> changeShape(), esta linea se reemplazo por la de abajo, porque tienen el mismo numero de argumentos () en este caso 0
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
        ),  
        
        
    );
  }
}