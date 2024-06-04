class Book {
  final int id;
  final String title;
  final String author;
  final String? brief;
  final String isbn;
  final String? cover;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.isbn,
    this.brief,
    this.cover,
  });
}
