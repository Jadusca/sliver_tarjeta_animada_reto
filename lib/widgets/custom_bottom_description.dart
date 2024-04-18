import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para la construcción de interfaces de usuario

// Define un widget que se extiende en un estado inmutable
class CustomBottomDescription extends StatelessWidget {
  const CustomBottomDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos en el inicio del eje transversal
      children: [
        Text(
          'Drama 😭 Fantasy ✨ Romance 😍', // Texto de la primera línea de descripción.
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400), // Estilo del texto.
        ),
        SizedBox(
          height: 2, // Establece un espacio vertical de 2 píxeles
        ),
        Text(
          'Science Fiction 😎', // Texto de la segunda línea de descripción.
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400), // Estilo del texto.
        )
      ],
    );
  }
}
