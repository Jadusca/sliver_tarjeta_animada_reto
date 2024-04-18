import 'package:flutter/material.dart';
import 'package:sliver_tarjeta_animada/widgets/theme.dart';

// Define un widget que se extiende en un estado inmutable
class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.size,
  });

  final Size size; //Tamaño del cuerpo

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),  // Establece el padding del contenedor
      color: backgroundcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos en el inicio del eje transversal
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribuye uniformemente los elementos a lo largo del eje principal
            children: [
              _CustomIcon(
                icon: Icons.stars,
                text: '89%',
              ),
              _CustomIcon(
                icon: Icons.tv,
                text: 'Netflix',
              ),
              _CustomIcon(
                icon: Icons.wc,
                text: 'Tv +14',
              ),
              _CustomIcon(
                icon: Icons.av_timer_rounded,
                text: '50m'
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child:  Text(
              'Es un k-drama que te encantara debes verlo',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 23),
            ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 10),
              child: Text(
                'Related shows',
                style: TextStyle(fontSize: 23),
              ),
              ),
              SingleChildScrollView( // Permite el desplazamiento de su hijo en una dirección determinada
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          height: size.height * 0.18, //Altura de la imagen
                          width: size.width * 0.23, // Establece el ancho de la imagen
                          image: AssetImage(
                            'assets/sliver/img${index + 1}.jpg',
                          ),
                          fit: BoxFit.fill, // Ajusta la imagen para llenar el espacio del contenedor
                        ),
                      ),
                    ))),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Seansons',
                  style: TextStyle(fontSize: 23),
                ),
                ),
                _Features(
                  size: size,
                  title: 'Seanson 1',
                  subtitle: '8 watched',
                  colorline: Colors.red,
                ),
                _Features(
                  size: size,
                  title: 'Seanson 2',
                  subtitle: '9 watched',
                  colorline: Colors.red,
                ),
                _Features(
                  size: size,
                  title: 'Seanson 3',
                  subtitle: '1 to air',
                  colorline: Colors.grey,
                ),
                _Features(
                  size: size,
                  title: 'Specials',
                  subtitle: '7 to watch',
                  colorline: Colors.grey,
                ),
        ],
      ));
  }
}

//Define un widget extendido en un estado inmutable
class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    // ignore: unused_element
    super.key,
    required this.icon,
    required this.text,
    });

    final IconData icon;
    final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 45,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }
}

//Define un widget extendido en un estado inmutable
class _Features extends StatelessWidget {
  const _Features({
    // ignore: unused_element
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.colorline,
    });

    final Size size;
    final String title;
    final String subtitle;
    final Color colorline;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width, //Establece el ancho del contenedor como el ancho de la pantalla
      color: backgroundcolor,
      height: 100, //Altura del contenedor
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 5,
                    color: colorline,
                  ),
                  )
              ],
            ),
            ),
            Icon(
              Icons.pending,
              color: Colors.grey[400],
            )
        ],
      ),
    );
  }
}