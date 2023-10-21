import 'package:flutter/material.dart';

class ActorSlider extends StatelessWidget {
  const ActorSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity, //sacar ancho de pantalla
      height: size.height * 0.30,
      color: Colors.blue,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Actores',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ), //espaciado a los lados de 20 pixeles
        ),
        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.horizontal, //pobnemos list view en horizontal
          itemCount: 20,
          itemBuilder: (_, int index) => _ActorPoster(), //VER QUE HACE ESTO
        )), //colunna tome el ancho del widget ques e pasará
      ]),
    );
  }
}

class _ActorPoster extends StatelessWidget {
  const _ActorPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/no-image.jpg'),
              width: 180,
              height: 210,
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'ElEdwin',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}