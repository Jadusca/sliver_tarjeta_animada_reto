import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para la construcción de interfaces de usuario.

// Define un widget que se extiende a un estado inmutable
class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15, // Posiciona el botón en la parte superior del 15% de la pantalla.
      left: 15, // Posiciona el botón a 15 píxeles desde el borde izquierdo de la pantalla.
      child: Icon(
        Icons.arrow_back, // Icono de flecha hacia atrás.
        size: 30, // Tamaño del icono.
        color: percent < 0.56 // Determina el color del icono basado en el porcentaje de desplazamiento.
            ? Colors.white.withOpacity(1 - percent) // Si el porcentaje es menor al 56%, el icono es blanco con transparencia.
            : Colors.black, // De lo contrario, el icono es negro.
      ),
    );
  }
}
