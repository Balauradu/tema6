import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tema6/src/containers/movies_container.dart';
import 'package:tema6/src/models/movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoviesContainer(builder: (BuildContext context, List<Movie> movies) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: const Text(
            'Movie List',
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8.0).copyWith(bottom: 56.8),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.purpleAccent,
                    child: Column(
                      children: [
                        Image.network(movie.mediumCover),
                        Text(movie.title)
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
