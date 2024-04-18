import 'dart:math'; // Importa la biblioteca de Dart para operaciones matemáticas.
import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para la construcción de interfaces de usuario.
import 'package:sliver_tarjeta_animada/widgets/custom_bottom_description.dart'; // Importa el widget de descripción personalizada de la parte inferior.

// Define un widget que se extiende en un estado inmutable
class DataCutRectangle extends StatelessWidget {
  const DataCutRectangle({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.34, top: 8), // Define el padding del widget.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos en el inicio del eje transversal.
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: percent > 0.13 // Ajusta el padding izquierdo basándose en el porcentaje de desplazamiento.
                    ? size.width * pow(percent, 5.5).clamp(0.0, 0.2) // Si el porcentaje es mayor al 13%, calcula el padding izquierdo.
                    : 0, // De lo contrario, establece el padding izquierdo como cero.
              top: size.height *
                  (percent > 0.48 // Ajusta el padding superior basándose en el porcentaje de desplazamiento.
                  ? pow(percent, 10.5).clamp(0.0, 0.06) // Si el porcentaje es mayor al 48%, calcula el padding superior.
                  : 0.0)), // De lo contrario, establece el padding superior como cero.
                  child: const Text(
                    'W: Two World', // Texto a mostrar.
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600), // Estilo del texto.
                    textAlign: TextAlign.start, // Alineación del texto.
                  ),
          ),
          if (percent < 0.50) ...[ // Verifica si el porcentaje de desplazamiento es menor al 50%.
            const SizedBox(
              height: 2, // Establece un espacio vertical de 2 píxeles.
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200), // Duración de la animación de opacidad.
              opacity: 1 - percent.clamp(0.0, 1.0), // Calcula la opacidad basada en el porcentaje de desplazamiento.
              child: const CustomBottomDescription(), // Muestra la descripción personalizada de la parte inferior.
            )
          ]
        ],
      ),
    );
  }
}
