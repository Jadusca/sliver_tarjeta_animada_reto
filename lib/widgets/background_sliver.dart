import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para la construcción de interfaces de usuario.

// Define un widget que se extiende en un estado inmutable
class BackgroundSliver extends StatelessWidget {
  const BackgroundSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned( // Posiciona el widget dentro de su padre
      left: 0, // Posiciona el widget al borde izquierdo
      right: 0, // Posiciona el widget al borde derecho
      bottom: 0, // Posiciona el widget en la parte inferior
      top: 0, // Posiciona el widget en la parte superior
      child: Image( // Muestra una imagen
        image: AssetImage( // Carga la imagen desde un recurso en el proyecto
          'assets/sliver/w1.jpg', // Ruta de la imagen en el proyecto
        ),
        fit: BoxFit.cover, // Ajusta la imagen para cubrir completamente el área del widget
      ),
    );
  }
}
