import 'package:flutter/foundation.dart';

import 'genre.dart';

class MovieDetails {
  final int id;
  final int budget;
  final int runtime;

  final String title;
  final String overview;
  final String posterPath;
  final String originalTitle;

  final double voteAverage;

  final List<Genre> genres;

  final DateTime releaseDate;

  MovieDetails({
    required this.id,
    required this.budget,
    required this.runtime,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.originalTitle,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
  });

  factory MovieDetails.fromMap(Map<String, dynamic> json) {
    return MovieDetails(
      id: json['id'],
      budget: json['budget'],
      runtime: json['runtime'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      originalTitle: json['original_title'],
      voteAverage: json['vote_average'] ?? 0.0,
      releaseDate: DateTime.parse(json['release_date']),
      genres: json['genres'] != null
          ? (json['genres'] as List)
              .map((genres) => Genre.fromMap(genres))
              .toList()
          : [],
    );
  }

  @override
  String toString() {
    return 'MovieDetails(id: $id, budget: $budget, runtime: $runtime, title: $title, overview: $overview, posterPath: $posterPath, originalTitle: $originalTitle, voteAverage: $voteAverage, genres: $genres, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetails &&
        other.id == id &&
        other.budget == budget &&
        other.runtime == runtime &&
        other.title == title &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.originalTitle == originalTitle &&
        other.voteAverage == voteAverage &&
        listEquals(other.genres, genres) &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        budget.hashCode ^
        runtime.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        originalTitle.hashCode ^
        voteAverage.hashCode ^
        genres.hashCode ^
        releaseDate.hashCode;
  }
}
