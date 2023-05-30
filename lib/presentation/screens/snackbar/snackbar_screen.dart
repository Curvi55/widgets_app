import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); //este codigo solo para que halla un snack a la vez.

    final snackBar = SnackBar(
      content: const Text('Hola mundo!'),
      action: SnackBarAction(
          label: 'click me',
          onPressed: () {}), // otras configuraciones de los snackbars
      duration: const Duration(
          seconds: 2), // otro ejemplo de configuracion del snackbar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // este metodo sera utilizado para hacer un dialog personalizado
  // se necesita el context para saber la posicion los colores etc
  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // para que no pueda cerrar el dialog dando click a otro lado
      builder: (context) => AlertDialog(
        
        title: const Text('¿Estas seguro?'),
        content: const Text(
            'Officia irure ad veniam deserunt sunt laborum ex duis deserunt cupidatat. Mollit cupidatat adipisicing eu aliqua ipsum eu. Eiusmod ullamco commodo enim id esse aliquip amet Lorem. Aute non aute cupidatat nostrud exercitation laboris esse ex mollit cillum mollit esse culpa pariatur. Magna exercitation Lorem tempor amet Lorem ea qui minim. Culpa commodo ullamco magna dolore sit eu occaecat aliqua fugiat Lorem cillum in. Mollit id veniam eu excepteur commodo dolor nisi reprehenderit irure.'),
        actions: [
          TextButton(
              onPressed: () =>
                  context.pop(), //context.pop cierra el dialogo abierto, debido al uso de go_router
              child: const Text('Cancelar')),
          FilledButton(
              //onPressed: () {},
              onPressed: () =>
                  context.pop(), //context.pop cierra el dialogo abierto
              child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // se le agrega esto para que el boton se centre verticalmente
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    // recordar que el texto se genra automatico usando ctrl+shift+p  (consola) y escribes ipsum
                    const Text(
                        'Ad culpa ullamco sint ut exercitation esse aliqua incididunt. Amet nostrud sit consectetur occaecat laborum commodo eiusmod ex. Ad et exercitation veniam sit incididunt proident elit ullamco. Eiusmod fugiat nostrud ea fugiat fugiat sit. Duis pariatur et qui in laboris velit id proident fugiat. Pariatur labore exercitation laboris minim nostrud pariatur eiusmod consequat dolor id. Dolore labore adipisicing irure magna ut aute quis id deserunt.')
                  ]); // este dialogo muestra el nombre de la app definido en el main., tambien se podria desde el dialogo
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar dialogos'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Mostrar snackabar'),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackBar(context)),
    );
  }
}
