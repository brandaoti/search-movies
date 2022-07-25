class Crew {
  final int id;
  final String name;

  Crew({
    required this.id,
    required this.name,
  });

  factory Crew.fromMap(Map<String, dynamic> json) {
    return Crew(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() => 'Crew(id: $id, name: $name)';
}
