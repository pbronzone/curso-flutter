import 'package:flutter/material.dart';
import 'package:listview/domain/movie.dart';

import '../../datasource/movie_datasource.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieId;
  const MovieDetailScreen({super.key, required this.movieId});
  static const String name = 'movie_detail_screen';

  @override
  Widget build(BuildContext context) {
    return _MovieDetailView(
      movieId: movieId,
    );
  }
}

class _MovieDetailView extends StatelessWidget {
  final String movieId;
  const _MovieDetailView({
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final Movie movie = movies.firstWhere((element) => element.id == movieId);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterUrl as String,
                  height: 500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                movie.title,
                style: const TextStyle(
                    /*fontWeight: FontWeight.bold,*/ fontSize: 30),
                textAlign: TextAlign.left,
              ),
              Text(
                movie.director,
                style: textStyle.bodyLarge,
              ),
              Text(
                movie.year.toString(),
                style: textStyle.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  movie.synopsis,
                  style: textStyle.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
