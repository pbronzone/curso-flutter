class Movie {
  final String id;
  final String title;
  final String director;
  final String synopsis;
  final String? posterUrl;
  final String? starring;
  final int? year;

  Movie(
      {required this.id,
      required this.title,
      required this.director,
      required this.synopsis,
      this.posterUrl,
      this.starring,
      this.year});
}
