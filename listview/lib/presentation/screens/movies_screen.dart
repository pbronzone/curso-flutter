import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listview/datasource/movie_datasource.dart';
import 'package:listview/domain/movie.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  static const String name = 'movies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies Screen',
        ),
      ),
      body: const _MoviesView(),
    );
  }
}

class _MoviesView extends StatelessWidget {
  const _MoviesView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final Movie movie = movies[index];
          return _MovieItemView(
            movie: movie,
          );
        });
  }
}

class _MovieItemView extends StatelessWidget {
  final Movie movie;
  const _MovieItemView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(movie.posterUrl as String),
        ),
        title: Text(movie.title),
        subtitle: Text(movie.director),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        onTap: () => context.push('/movie_detail_screen/${movie.id}'),
      ),
    );
  }
}
