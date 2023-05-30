// hacker string color is #109c11

import 'package:flutter/material.dart';

// tipos de tarjetas predeterminadas
//const cards = <Map<String, dynamic>>[  // forma alternativa de declaración
const List<Map<String, dynamic>> cards = [
  {'elevation': 0.0, "label": 'Elevation 0'},
  {'elevation': 1.0, "label": 'Elevation 1'},
  {'elevation': 2.0, "label": 'Elevation 2'},
  {'elevation': 3.0, "label": 'Elevation 3'},
  {'elevation': 4.0, "label": 'Elevation 4'},
  {'elevation': 5.0, "label": 'Elevation 5'},
];

/// MULTI LINEAS
/// AUTOMATICAS

class CardsScreen extends StatelessWidget {
  // esta propiedad name es para trabajar con go_router, es static porque no
  // se quiere crear una instancia de esta clase solo para saber el nombre

  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    // para evitar el error de  desborde se agrega este widget SingleChildScrollView
    // basicamente agrega un scroll para que todos los cards puedan ser desplegados sin problemas
    return SingleChildScrollView(
      child: Column( 
        children: [
          // los 3 puntos ...  es conocido como spread
          // sería basicamente expandir/separar los elementos que estan dentro de la lista cards en este contexto
          // porque basicamente children: espera un widget, no un List<Map<String, dynamic>>  ITERABLE
          // por eso al aplicarle el spread ...  sacamos cada elemento de la lista y se lo pasamos al children:
          // cada widget individual
    
          ...cards.map(// notese que está retornando un iterable
              (card) => _CardType1(
                  // notese el uso de card y no la variable  cardS para referenciar el valor
                  label: card["label"],
                  elevation: card['elevation'])),

           ...cards.map(// notese que está retornando un iterable
              (card) => _CardType2(
                  // notese el uso de card y no la variable  cardS para referenciar el valor
                  label: card["label"],
                  elevation: card['elevation'])),


          ...cards.map(// notese que está retornando un iterable
              (card) => _CardType3(
                  // notese el uso de card y no la variable  cardS para referenciar el valor
                  label: card["label"],
                  elevation: card['elevation'])),

          ...cards.map(// notese que está retornando un iterable
              (card) => _CardType4(
                  // notese el uso de card y no la variable  cardS para referenciar el valor
                  label: card["label"],
                  elevation: card['elevation'])),
          


           // para dejar un poco de espacio al final del scroll se podria agregar un Sizedbox
           const SizedBox(height: 5.0,)  
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    // aqui es el punto donde se crea un nuevo widget para ser usado en el children: de la columna
    // Card es el widget propio de flutter
    return Card(
        elevation: elevation,
        //agregamos un padding para poder darle espacio al contenido que esta en el card
        
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          //dentro del padding child con columnas
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {}, 
                    icon: const Icon(Icons.more_vert_outlined)
                  ),
                
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(label)
                )
            ],
          ),
        ));
  }
}


class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {

    // usar el shortcut del ide theme-of-context para escribir la linea de abajo
    final colors = Theme.of(context).colorScheme;

    // aqui es el punto donde se crea un nuevo widget para ser usado en el children: de la columna
    // Card es el widget propio de flutter
    return Card(

        //modificaciones en CardType 2 shape
        shape:RoundedRectangleBorder(
          //vamos a ponerle un borde redondito al card cuadrado
          borderRadius: BorderRadius.circular(12),
          side:BorderSide(
            color: colors.outline
          )),
        elevation: elevation,
        //agregamos un padding para poder darle espacio al contenido que esta en el card

        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          //dentro del padding child con columnas
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined)),
              ),
              Align(alignment: Alignment.bottomLeft, child: Text(label))
            ],
          ),
        ));
  }
}


class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;



    // aqui es el punto donde se crea un nuevo widget para ser usado en el children: de la columna
    // Card es el widget propio de flutter
    return Card(

        color: colors.surfaceVariant, // notese el colors del colorScheme.
        elevation: elevation,
        //agregamos un padding para poder darle espacio al contenido que esta en el card

        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          //dentro del padding child con columnas
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined)),
              ),
              Align(alignment: Alignment.bottomLeft, child: Text('$label - filled card'))
            ],
          ),
        ));
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // aqui es el punto donde se crea un nuevo widget para ser usado en el children: de la columna
    // Card es el widget propio de flutter
    return Card(

        // este clipbehavior es similar cliprrect para evitar que salga de su widget padre, crea las esquinas redondeada
        clipBehavior: Clip.hardEdge,    
        elevation: elevation,
        //agregamos un padding para poder darle espacio al contenido que esta en el card

        child: Stack(    // a diferencia de column este va un layer sobre otro layer el ultimo widget en la lista es el mas top
          children: [

           Image.network(
            'https://picsum.photos/id/${ elevation.toInt() }/600/350',
            height: 350,
            fit: BoxFit.cover,
           ),   

            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration:const  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                ),  
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined)),
              ),
            )
          ],
        ));
  }
}
