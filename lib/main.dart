import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_tarjeta_animada/widgets/home_challenge_sliver.dart';
import 'package:sliver_tarjeta_animada/widgets/theme.dart';

// Funcion principal que ejecuta la aplicación
void main() {
  runApp(const MyApp()); // Se inicializa y ejecuta la aplicación
}

// Definición de la clase MyApp que se extiende a un estado inmutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Deshabilira la etiqueta de desarrollador
      title: 'Silver Tarjetas Animadas', // Titulo de la aplicación
      theme: theme, // Aplica el tema personalizado que se definio en 'theme.dart'
      home: const HomeSliverChallenge(), // Establece el widget inicial que se muestra en la pantalla
    );
  }
}
