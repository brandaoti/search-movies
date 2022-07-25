import 'package:flutter/foundation.dart';

import '../client/client.dart';
import 'company.dart';
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
  final List<Company> companies;

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
    required this.companies,
    required this.releaseDate,
  });

  factory MovieDetails.fromMap(Map<String, dynamic> json) {
    return MovieDetails(
      id: json['id'],
      budget: json['budget'],
      runtime: json['runtime'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? ApiPathSettings.FILE_NOT_FOUND,
      originalTitle: json['original_title'],
      voteAverage: json['vote_average'] ?? 0.0,
      releaseDate: DateTime.parse(json['release_date']),
      genres: json['genres'] != null
          ? (json['genres'] as List)
              .map((genres) => Genre.fromMap(genres))
              .toList()
          : [],
      companies: json['production_companies'] != null
          ? (json['production_companies'] as List)
              .map((companies) => Company.fromMap(companies))
              .toList()
          : [],
    );
  }

  @override
  String toString() {
    return 'MovieDetails(id: $id, budget: $budget, runtime: $runtime, title: $title, overview: $overview, posterPath: $posterPath, originalTitle: $originalTitle, voteAverage: $voteAverage, genres: $genres, companies: $companies, releaseDate: $releaseDate)';
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
        listEquals(other.companies, companies) &&
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
        companies.hashCode ^
        releaseDate.hashCode;
  }

  MovieDetails copyWith({
    int? id,
    int? budget,
    int? runtime,
    String? title,
    String? overview,
    String? posterPath,
    String? originalTitle,
    double? voteAverage,
    List<Genre>? genres,
    List<Company>? companies,
    DateTime? releaseDate,
  }) {
    return MovieDetails(
      id: id ?? this.id,
      budget: budget ?? this.budget,
      runtime: runtime ?? this.runtime,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      originalTitle: originalTitle ?? this.originalTitle,
      voteAverage: voteAverage ?? this.voteAverage,
      genres: genres ?? this.genres,
      companies: companies ?? this.companies,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }
}
