import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para la construcción de interfaces de usuario.

// Define un widget que se extiende a un estado inmutable
class FavoriteCircle extends StatelessWidget {
  const FavoriteCircle({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: size.height * 0.10, // Posiciona el círculo en la parte inferior de la pantalla
      right: 10, // Posiciona el círculo a 10 píxeles desde el borde derecho de la pantalla
      child: percent < 0.2 // Verifica si el porcentaje de desplazamiento es menor al 20%
          ? TweenAnimationBuilder<double>(
              tween: percent < 0.17 // Utiliza una animación de interpolación si el porcentaje es menor al 17%
                  ? Tween(begin: 1, end: 0) // Si es así, la animación oculta el círculo
                  : Tween(begin: 0, end: 1), // De lo contrario, la animación muestra el círculo
              duration: const Duration(milliseconds: 300), // Duración de la animación
              builder: (context, value, widget) {
                return Transform.scale(
                  scale: 1.0 - value, // Escala el círculo basado en el valor de la animación
                  child: CircleAvatar(
                    minRadius: 20, // Establece el radio mínimo del círculo
                    backgroundColor: Colors.red[300], // Establece el color de fondo del círculo
                    child: Icon(
                      Icons.favorite, // Icono de corazón como favorito
                      color: Colors.red[900], // Establece el color del icono
                    ),
                  ),
                );
              })
          : Container(), // Si el porcentaje es mayor o igual al 20%, no se muestra ningún círculo
    );
  }
}
