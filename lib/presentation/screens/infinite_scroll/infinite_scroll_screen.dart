import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiteScrollScreen extends StatefulWidget {
  static const name = 'infinite _screen';

  const InfiteScrollScreen({super.key});

  @override
  State<InfiteScrollScreen> createState() => _InfiteScrollScreenState();
}

class _InfiteScrollScreenState extends State<InfiteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController  scrollController  = ScrollController(); // crea el objeto scrollController de la clase
  bool isLoading = false; //es una bandera para sincronizar las cargas
  bool isMounted = true;

 //para trabajar con el scroller se hace un init
 @override
  void initState() {
    
    super.initState();
    scrollController.addListener(() {
        //quiero cargar mas imagenes cuando estoy al puro final
        //scrollController.position.pixels position actual
        //; //esto es lo maximo a que podria llegar el scroll en este device
        if ( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
          // carga mas imagenes
          //addFiveImages();
          loadNextPage();
        }
        

     });

  }
  // si vas a meter un initstate mete inmediatamente un dispose
  @override
  void dispose() {
    isMounted =false;
    scrollController.dispose();
    super.dispose();
  }

   //simulación de una función asincrona para propositos demostrativos en la app
   Future loadNextPage() async {
        
        if (isLoading) return;   
        isLoading = true;   
        setState(() { });

        await Future.delayed(const Duration(seconds: 2));
        addFiveImages();
        isLoading = false;
        // con esto nos aseguramos de esperar hasta que el widget este montado cargado
        if (!isMounted) return;
        setState(() {
           // justamente despues de dibujar los nuevos widgets ,  verifiamos si estmos cerca del final para subirlo un poco si hay algo mas
           moveScrollToBottom();

        });
        
   }

  Future<void> onRefresh() async{

    isLoading = true;  // sincronizar cosas
    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;
    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear(); // es para hacer el total refresh desde 0
    imagesIds.add(lastId+1);
    addFiveImages();
    setState(() {
    });
  }


  void moveScrollToBottom(){
     
      if ( (scrollController.position.pixels + 150) <= scrollController.position.maxScrollExtent) return;

      // esto solo se ejecuta si estoy cerca del final
      scrollController.animateTo(
        scrollController.position.pixels + 120,
        duration: const Duration(milliseconds:300),
        curve: Curves.fastOutSlowIn,  
      );
      

  }
     

  void addFiveImages(  ){
    final lastId = imagesIds.last;  // .last seria similar a [length-1]
    // queremos agregar 5 mas 6,7,...10
    
           imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
       
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45, // fondo del scaffold  , full screen
      // mediaquery.removepadding para quitar el top de la app y usar toda la pantalla
      body: MediaQuery.removePadding(
        context: context,// para el mediaquery
        removeTop: true,
        removeBottom: true,
        //ahora vamos a agregar un pull to refresh sobre el listview.builder hay un widget que hace eso RefreshIndicator



        child: RefreshIndicator(

          onRefresh:  onRefresh, // tienen la misma cantidad d parametros se puede asignar directamente
          edgeOffset: 10.0, // espacio separador arriba
          strokeWidth: 2,
          child: ListView.builder(  //la idea del builder es que lo crea en tiempo de corrida, no es hardcodeado
              controller: scrollController, // conectamos el controller definido arriba
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                //return Text('hola input ...');
              
                return FadeInImage(
                  fit:BoxFit.cover,              
                  width: double.infinity,
                  height: 300,
                  placeholder:  const AssetImage('assets/images/jar-loading.gif'),
                               
                  image: NetworkImage('https://picsum.photos/id/${imagesIds[index] }/500/300'), // 500 ancho y 300 alto
                );
              
              }
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
              onPressed:()=>context.pop(),            
            // child:const Icon(Icons.exit_to_app_rounded),
            //este widget spinperfect es del paquete de fernando
            
            child: (!isLoading)?FadeIn(child: const  Icon(Icons.exit_to_app_rounded))
            : SpinPerfect(
                infinite: true, // propiedad del spinperfect de FH
                child: const Icon(Icons.refresh_rounded)),

         ),
    );
  }
}
