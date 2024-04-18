import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para la construcción de interfaces de usuario

// Define un widget que se extiende a un estado inmutable
class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( // Define la decoración del contenedor
        borderRadius: BorderRadius.circular(10), // Establece bordes redondeados para el contenedor
      ),
      width: size.width * 0.27, // Establece el ancho del contenedor como el 27% del ancho de la pantalla
      height: size.height * 0.18, // Establece la altura del contenedor como el 18% de la altura de la pantalla
      child: ClipRRect( // Aplica un recorte redondeado al contenido del contenedor
        borderRadius: BorderRadius.circular(10), // Establece bordes redondeados para el recorte
        child: Image.asset( // Muestra una imagen desde un recurso en el proyecto
          'assets/sliver/Two.jpg', // Ruta de la imagen en el proyecto
          fit: BoxFit.fill, // Ajusta la imagen para llenar el espacio del contenedor
        ),
      ),
    );
  }
}
