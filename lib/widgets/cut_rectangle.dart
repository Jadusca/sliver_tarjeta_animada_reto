import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para la construcción de interfaces de usuario
import 'package:sliver_tarjeta_animada/widgets/theme.dart'; // Importa el tema personalizado

// Define un pintor personalizado para dibujar un recorte rectangular
class CutRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // Crea un objeto de pintura para definir propiedades de dibujo
    paint.color = backgroundcolor; // Establece el color de la pintura utilizando el color de fondo del tema
    paint.style = PaintingStyle.fill; // Establece el estilo de la pintura como relleno
    paint.strokeWidth = 10; // Establece el ancho del trazo de la pintura

    final path = Path(); // Crea un objeto de ruta para definir la forma del recorte rectangular
    path.moveTo(0, size.height); // Mueve el punto de inicio de la ruta a la esquina inferior izquierda
    path.lineTo(size.width, size.height); // Dibuja una línea desde la esquina inferior izquierda hasta la esquina inferior derecha
    path.lineTo(size.width, 0); // Dibuja una línea desde la esquina inferior derecha hasta la esquina superior derecha
    path.lineTo(size.width * 0.27, 0); // Dibuja una línea desde la esquina superior derecha hasta un punto en el 27% del ancho de la pantalla

    canvas.drawPath(path, paint); // Dibuja la forma del recorte rectangular en el lienzo utilizando la pintura definida
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true; // Determina si el pintor debe volver a dibujar cuando cambia
}
