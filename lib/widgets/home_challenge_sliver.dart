import 'dart:math'; // Importa la biblioteca de Dart para operaciones matemáticas
import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para la construcción de interfaces de usuario
import 'package:sliver_tarjeta_animada/widgets/background_sliver.dart'; // Importa el widget de fondo para el encabezado de tipo sliver
import 'package:sliver_tarjeta_animada/widgets/body_sliver.dart'; // Importa el cuerpo del widget sliver
import 'package:sliver_tarjeta_animada/widgets/button_back.dart'; // Importa el botón de retroceso
import 'package:sliver_tarjeta_animada/widgets/cover_photo.dart'; // Importa el widget de foto de portada
import 'package:sliver_tarjeta_animada/widgets/cut_rectangle.dart'; // Importa el widget de recorte rectangular
import 'package:sliver_tarjeta_animada/widgets/data_cut_rectangle.dart'; // Importa el widget de datos del recorte rectangular.
import 'package:sliver_tarjeta_animada/widgets/favorite_circle.dart';

// Define una clase que representa un widget con estado mutable.
class HomeSliverChallenge extends StatefulWidget {
  const HomeSliverChallenge({super.key});

  @override
  State<HomeSliverChallenge> createState() => _HomeSliverChallengeState();
}

class _HomeSliverChallengeState extends State<HomeSliverChallenge> {
  @override
  Widget build(BuildContext context) {
    // Obtiene las dimensiones de la pantalla.
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Define un encabezado personalizado que se expande y colapsa.
          SliverPersistentHeader(delegate: _AppBarNetflix(
            minExtended: kToolbarHeight,
            maxExtended: size.height * 0.35,
            size: size,
          ),
          ),
          // Un adaptador para incorporar un widget que no es sliver dentro de un scroll sliver.
          SliverToBoxAdapter(
            child: Body(size: size),
          )
        ],
      ),
    );
  }
}

// Define el comportamiento del encabezado personalizado.
class _AppBarNetflix extends SliverPersistentHeaderDelegate{
  _AppBarNetflix({required this.maxExtended, required this.minExtended, required this.size});
  final double maxExtended;
  final double minExtended;
  final Size size;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Calcula el porcentaje de reducción del encabezado.
    final percent = shrinkOffset / maxExtended;
    // ignore: prefer_const_declarations
    final uploadlimit = 13 / 100; // Valida el ángulo en el que regresa la tarjeta.
    // Calcula el valor de retorno de la tarjeta.
    final valueback = (1 - percent - 0.77).clamp(0, uploadlimit);
    // Incrementa la rotación basada en el porcentaje de desplazamiento.
    final fixrotation = pow(percent, 1.5);

    // Crea instancias de los widgets de tarjeta y barra inferior personalizada.
    final card = _CoverCard(
      size: size,
      percent : percent,
      uploadlimit : uploadlimit,
      valueback : valueback,
    );

    final bottomsliverbar = _CustomBottomSliverBar(
      size: size,
      fixrotation: fixrotation,
      percent: percent,
    );

    // Estructura visual del encabezado, usando Stack para sobreponer elementos.
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Stack(
        children: [
          const BackgroundSliver(),
          if (percent > uploadlimit)...[
            card,
            bottomsliverbar,
          ] else ...[
            bottomsliverbar,
            card,
          ],
          ButtonBack(
            size: size,
            percent: percent
          ),
          FavoriteCircle(
            size: size,
            percent: percent
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtended;

  @override
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
  false;

}

// Muestra una tarjeta con una foto de portada que rota basándose en el desplazamiento del scroll.
class _CoverCard extends StatelessWidget {
  // ignore: unused_element
  const _CoverCard({super.key, required this.size, required this.percent, required this.uploadlimit, required this.valueback});
  final Size size;
  final double percent;
  final double uploadlimit;
  final num valueback;

  // Ángulo fijo para la rotación de la tarjeta.
  final double angleForCard = 6.5;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15,
      left: size.width / 24,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.identity()..rotateZ(
          percent > uploadlimit
          ? (valueback * angleForCard) :
          percent * angleForCard,
          ),
        child: CoverPhoto(size: size),
      ),
    );
  }
}

// Barra inferior personalizada que se ajusta y rota basándose en el desplazamiento del scroll.
class _CustomBottomSliverBar extends StatelessWidget{
  // ignore: unused_element
  const _CustomBottomSliverBar({super.key, required this.size, required this.fixrotation, required this.percent});
  final Size size;
  final num fixrotation;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: -size.width * fixrotation.clamp(0, 0.35),
      right: 0,
      child: _CustomBottomSliver(
        size: size,
        percent: percent,
        ));
  }
}

// Contenido de la barra inferior personalizada.
class _CustomBottomSliver extends StatelessWidget {
  const _CustomBottomSliver({
    // ignore: unused_element
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: size.height * 0.12,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: CutRectangle(),
          ),
          DataCutRectangle(
            size: size,
            percent: percent
          ),
        ],
      ),
    );
  }
}
