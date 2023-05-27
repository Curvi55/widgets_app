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
          title: const Text('Buttons Screen'),
        ),
        // body: const Placeholder(), se extrae este PlaceHolder y le cambiamos el nombre a _ButtonsView()
        body: const _ButtonsView(),
        floatingActionButton: FloatingActionButton(
          // se usa el child para asignarle un iconito
          // si no sale el preview del icon for some reason,  doble ctrl space (1 muestra menu) ctrl space (2 muestra el preview)
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ));
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    // return SizedBox( se reemplazo el SizedBox para dejar espacios suficientes en el espacio principal
    // ahora el sizedbox va a ser el padre del Padding le va a hacer un wrapping
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),

        // Un Wrap widget es similar a una columna a un row, va poniendo elementos
        // horizontalmente cuando pega borde baja a la siguiente columna
        child: Wrap(
          // para manejar espacio entre buttons se agrega spacing, mete espacio en 4 direcciones
          spacing: 5,
          alignment: WrapAlignment
              .center, // para que funcionara se tuvo que envolver todo con el sizedbox para que extendiera el espacio usable del wrap
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('elevated ')),
            // button apagado
            const ElevatedButton(
                onPressed: null, child: Text('elevated disabled')),
            // =======================Elevated button con Icon
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon'),
            ),
            // =======================FilledButton
            FilledButton(onPressed: () {}, child: const Text('Filled button')),

            // =======================FilledButton Icon  (no tiene child) pero si label
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.accessibility_new),
                label: const Text('Filled Icon')),

            // =======================OutlinedButton   (no tiene child) pero si label
            OutlinedButton(
                onPressed: () {}, child: const Text('outlined button')),
            // =======================OutlinedButton Icon
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_time),
              label: const Text('Outlined icon'),
            ),
            // TextButton
            TextButton(onPressed: () {}, child: const Text('text button')),
            TextButton.icon(
              icon: const Icon(Icons.account_box_outlined),
              onPressed: () {}, 
              label: const Text('text button')
              ),

            //IconButton
            IconButton(
              icon: const Icon(Icons.access_alarms_rounded),
              onPressed: () {},              
              ),
              //IconButton Style
              IconButton(
              icon: const Icon(Icons.access_alarms_rounded),
              onPressed: () {},
              style:const ButtonStyle(
                 backgroundColor:  MaterialStatePropertyAll(Colors.blue),
                 iconColor: MaterialStatePropertyAll( Colors.white),
                 splashFactory: InkSparkle.splashFactory
               )
            ),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

// boton desde 0 , customizado / personalizado

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    // se envuelve  ahora Material con clipRRect para hacer bordes redondos.
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        //Inkwell es como un gestore detector para botones
        // reacciona cuando tienes un splash method
        
     
        child: InkWell(
        
          onTap: () {},
          //splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          child: const Padding(
            
            padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
            child: Text('customized',style: TextStyle(color: Colors.white)),
            ),
        ),
      ),
    );
  }
}