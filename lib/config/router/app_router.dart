
import 'package:go_router/go_router.dart';

// NOTESE LA IMPORTACIÓN DEL ARCHIVO BARRIL CON TODAS LAS SCREENS
import '../../presentation/screens/screens.dart';


// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',  //pagina default donde se abre
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),


  ],
);