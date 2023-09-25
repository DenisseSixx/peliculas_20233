import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    //recibir argumentos de otra pantalla
    final String movie =ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin nombre';
    return const Scaffold(
      body: CustomScrollView(
        //widget con comportamiento predefinidos al scroll
        slivers: [_CustomAppBar(),
        SliverList(delegate: SliverChildListDelegate.fixed([
          _PosterAndTitle(),
          _Overview(),
          MovieSlider2()
          

        ],
        ),
        )
        ],
      )
    );
  }
}
class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      //widget para que se ajuste al tamano
      flexibleSpace: FlexibleSpaceBar(centerTitle: true,
      //eliminar padding
      titlePadding: EdgeInsets.all(0),
      title: Container(
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        color: Colors.black12,
        child: Text(
          'movie.title',
        style:  TextStyle(fontSize: 18),),
      ),
      background: FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        image: AssetImage('assets/no-image.jpg'),
      ),
      ),
    );
    }
    }

    class _PosterAndTitle extends StatelessWidget {
      const _PosterAndTitle({super.key});
    
      @override
      Widget build(BuildContext context) {
        return Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20 ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/no-image.jpg'),
                height: 250,
                ),
              ),
              SizedBox(width: 20),
             const Expanded(
                child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'movie.title',
                      style: TextStyle(fontSize: 30),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                     Text(
                      'movie.titleOriginal',
                      style: TextStyle(fontSize: 30),
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
                          'movie.voteAverage',
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      ],
                    )
                  ],
                
              ))
            ],
          ),
        );
      }
 
    }
    class _Overview extends StatelessWidget {
      const _Overview({super.key});
    
      @override
      Widget build(BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
          child: Text('Elit laborum mollit reprehenderit duis eiusmod et minim reprehenderit velit proident aliqua nulla duis exercitation. Irure veniam non quis dolore commodo officia mollit ea aute nisi adipisicing tempor minim. Dolor mollit proident adipisicing officia consectetur nulla. Eiusmod magna sint ullamco dolore officia in aliqua cupidatat ipsum nisi qui cillum Lorem dolor. Aliquip esse aliqua minim labore officia.', textAlign: TextAlign.justify, style: TextStyle(fontSize: 15),
          ), //edgeinsets.symmetric constructor con nombre 
        );
      }
    }
   

class MovieSlider2 extends StatelessWidget {
  const MovieSlider2({super.key});

 @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .30,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Populares',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Colors.white,
                ),
              )),
              Expanded(child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, index) =>const _MoviePoster2(),
              ),
              ),
        ],
      ),
    );
  }
}

class _MoviePoster2 extends StatelessWidget {
  const _MoviePoster2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 250,
      color: Color.fromARGB(255, 62, 207, 135),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/no-image.jpg'),
                width: 180,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 8,),
          const Text('Quiero mover el bote, me gusta.. mueve! ',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}