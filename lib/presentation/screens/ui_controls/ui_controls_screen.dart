import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UI controls'), 
        ),
        body: const _UIControlsView()
      );    
  }
}

// para hacer que el switch cambie su estado, vamos a convertir el statelesswidget a stateful
class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

// para el radioList tile
enum Transportation {car, plane,boat, submarine}

class _UIControlsViewState extends State<_UIControlsView> {


  // una vez convertido a stateful declaramos la variable que queremos conservar el estado
  bool isDeveloper = true;
  // nos vamos a crear una propiedad de tipo transportation
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;


  @override
  Widget build(BuildContext context) {
    return ListView(
      //vamos a quitar la fisica de rebote completamente
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: const Text('controles adicionales'),
          value: isDeveloper, 
          onChanged: (value)=> setState(() {
            isDeveloper = !isDeveloper; // se le asigna el valor contrario al que tenia, switch ;)
          })
        ),
        // dice FH que ExpansionTile es super super genial
        ExpansionTile(
          title: const Text('Vehículo de Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
             RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('viaja por auto'),
                value: Transportation.car,
                groupValue:
                    selectedTransportation, // indica cual de las 3 opciones esta seleccionada
                // notese que dart sabe que este value es de tipo Transportation por lo que se le asigno antes
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text('by Plane'),
                subtitle: const Text('viaja por avión'),
                value: Transportation.plane,
                groupValue:
                    selectedTransportation, // indica cual de las 3 opciones esta seleccionada
                // notese que dart sabe que este value es de tipo Transportation por lo que se le asigno antes
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text('by Boat'),
                subtitle: const Text('viaja por bote'),
                value: Transportation.boat,
                groupValue:
                    selectedTransportation, // indica cual de las 3 opciones esta seleccionada
                // notese que dart sabe que este value es de tipo Transportation por lo que se le asigno antes
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text('by Submarine'),
                subtitle: const Text('viaja por Submarino'),
                value: Transportation.submarine,
                groupValue:
                    selectedTransportation, // indica cual de las 3 opciones esta seleccionada
                // notese que dart sabe que este value es de tipo Transportation por lo que se le asigno antes
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.submarine;
                    })),

          ],
          ),
      
          CheckboxListTile(
            title: const Text('¿Desayuno?'),
            value: wantsBreakFast, 
            onChanged: (value)=> setState(() {
              wantsBreakFast =!wantsBreakFast;
            })
          ),
        CheckboxListTile(
            title: const Text('Almuerzo?'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })
        ),
        CheckboxListTile(
            title: const Text('¿Cena?'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
        }))


      ],
    );
  }
}
