class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String originalTitle;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.originalTitle,
  });

  factory MovieModel.fromMap(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      originalTitle: json['original_title'],
    );
  }

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, overview: $overview, posterPath: $posterPath, originalTitle: $originalTitle)';
  }
}
