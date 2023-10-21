import 'package:flutter/material.dart';
import 'package:peliculas_20233/widgets/actor_slider.dart';
import 'package:peliculas_20233/models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final String movie =
    // ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin nombre';
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
        //widget con comportamiento predefinidos al scroll
        slivers: [
          _CustomAppbar(
            movies: movie,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [_PosterAndTitle(movie: movie), 
              _Overview(
                movies:movie,
              ), ActorSlider()],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  final Movie movies;

  const _CustomAppbar({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200, //maximo ue se puede expandir
      floating: false, //esto es la sombra
      pinned: true,
      //WIDGET PARA QUE SE AJUSTE AL TAMAÑO
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //Eliminar padding
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            movies.title,
            style: TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movies.fullBackdropImg),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              height: 250,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //centra a izquierda
              children: [
                Text(
                  movie.title,
                  style: TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 5),
                    Text(
                      movie.voteAverage.toString(),
                      style: TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movies;
  const _Overview({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
       movies.overview,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15),
      ), //ESTO ES UN CONSTRUCTOR CON NOMBRE buscar lorem
    );
  }
}