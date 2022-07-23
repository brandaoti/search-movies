import 'package:flutter/foundation.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final List<int> genreIds;
  final List<String>? genresName;
  final String originalTitle;

  Movie({
    this.genresName,
    required this.genreIds,
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.originalTitle,
  });

  factory Movie.fromMap(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      originalTitle: json['original_title'] ?? '',
      genreIds: (json['genre_ids'] as List)
          .map((id) => int.parse(id.toString()))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, posterPath: $posterPath, genreIds: $genreIds, genres: $genresName, originalTitle: $originalTitle)';
  }

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    List<int>? genreIds,
    List<String>? genres,
    String? originalTitle,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      genreIds: genreIds ?? this.genreIds,
      genresName: genres ?? genresName,
      originalTitle: originalTitle ?? this.originalTitle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.id == id &&
        other.title == title &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        listEquals(other.genreIds, genreIds) &&
        listEquals(other.genresName, genresName) &&
        other.originalTitle == originalTitle;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        genreIds.hashCode ^
        genresName.hashCode ^
        originalTitle.hashCode;
  }
}
