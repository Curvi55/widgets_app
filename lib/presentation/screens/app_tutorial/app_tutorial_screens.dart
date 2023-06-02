import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//vamos a utilizar 3 slides

class Slideinfo {
  final String title;
  final String caption;
  final String imageURL;
  //vamos a usar campos posicionales en el constructor
  Slideinfo(this.title, this.caption, this.imageURL);
}

final slides = <Slideinfo>[
  Slideinfo(
      'Busca la comida',
      ' Sint nostrud labore veniam dolor sit id labore fugiat amet laboris laborum non.',
      'assets/images/1.png'), //notese que el path es case sensitive debe hacer perfect match con el pubspec.yaml

  Slideinfo(
      'Entrega la comida',
      'Voluptate laborum consequat quis amet duis tempor proident enim nostrud sint laborum ut duis.',
      'assets/images/2.png'),
  Slideinfo(
      'Disfruta la comida',
      'Ullamco cupidatat eiusmod aute nulla culpa duis reprehenderit dolore consectetur nostrud adipisicing.',
      'assets/images/3.png'),
];

// convertimos el statelesswidget a stateful para poder meter el controlador de posicion del pageview
class AppTutorialScreens extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreens({super.key});

  @override
  State<AppTutorialScreens> createState() => _AppTutorialScreensState();
}

class _AppTutorialScreensState extends State<AppTutorialScreens> {
  //metemos el objeto controlador y al state ;)

  final PageController pageviewController = PageController();
  bool endReached = false;

  //ahora vamos a agregar un listener, basado en el stateful
  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      // toda la informacion ya está en el pageViewcontroller
      final pageIndex = pageviewController.page ?? 0;

      // notese el -1.5 esto es para que lo haga justo antes de llegar al final final
      if (!endReached && pageIndex >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  //  ES BUENA PRACTICA EN UN STATEFUL widget llamar al dispose
  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose(); // es escrito  automaticamente por el plugin
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors
            .white, // esto para que no contraste con las imagenes que tienen fondo blanco
        // appBar: AppBar para este ejemplo no se le pone un appbar
        // en el body ponemos un pageView como el que se utilizo en la app que hicimos de toktik
        // a ese pageView lo envolvemos luego en un stack similar a column para que ponga children: y la idea es poner boton derecho arriba
        body: Stack(
          children: [
            PageView(
              // metemos el controlador de la pagina
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: // [ sin brackets poque es solo un elemento
                  slides
                      .map((slideData) => _Slide(
                          title: slideData.title,
                          caption: slideData.caption,
                          imageURL: slideData.imageURL))
                      .toList(), // notese que slides.map es un iterable, por eso se convierte a list para poerlo mandar al children
            ),
            Positioned(
                // al estar dentro de un positioned puedo darle la ubicación
                right: 20,
                top: 30,
                child: TextButton(
                  child: const Text('Salir'),
                  onPressed: () => context.pop(),
                )),
            endReached
                ? Positioned(
                    bottom: 2,
                    right: 5,
                    // para ponerle estilo al FilledButton se agrego el paquete de animacion de fernando
                    // ctrl + shift + P pubassist  animate_do    para agregar el paquete luego envolvemos
                    // el filledbutton con uno de los metodos de animate_do

                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(seconds: 1),
                      //duration: const Duration(seconds: 10),
                      child: FilledButton(
                        child: const Text('Comenzar'),
                        onPressed: () => context.pop(),
                      ),
                    ))
                : const SizedBox(),
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageURL;

  const _Slide(
      {required this.title, required this.caption, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      //vamos a usar un padding para que no quede tan pegado a los borders
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          // para centrar verticalmente
          mainAxisAlignment: MainAxisAlignment.center,
          //ahora alineacion horizonal
          crossAxisAlignment:
              CrossAxisAlignment.start, // los pega bastante al borde izq
          children: [
            const SizedBox(
              height: 20,
            ),
            Image(image: AssetImage(imageURL)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 20),
            Text(
              caption,
              style: captionStyle,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
