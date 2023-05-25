// notese el uso de show, esto es para especiaf exactamente lo que se necesita y no mas
import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;


    
   const MenuItem({

      required this.title,
      required this.subTitle,
      required this.link,
      required this.icon
    });
}
    List<MenuItem> appMenuItems = [

     const MenuItem(
        title:'Botones' ,
        subTitle: 'Varios botones en flutter',
        link:'/buttons'  ,
        icon:Icons.smart_button_outlined 
        ),

      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
/*
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/card'  ,
        icon:Icons.credit_card
        ),
*/

    ];

