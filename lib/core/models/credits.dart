import 'cast.dart';
import 'crew.dart';

class Credits {
  Credits({
    required this.id,
    required this.casts,
    required this.crew,
  });

  final int id;
  final List<Cast> casts;
  final List<Crew> crew;

  factory Credits.fromMap(Map<String, dynamic> json) {
    return Credits(
      id: json['id'],
      crew: json['crew'] != null
          ? (json['crew'] as List).map((crew) => Crew.fromMap(crew)).toList()
          : [],
      casts: json['cast'] != null
          ? (json['cast'] as List).map((cast) => Cast.fromMap(cast)).toList()
          : [],
    );
  }

  @override
  String toString() => 'Credits(id: $id, casts: $casts, crew: $crew)';
}
