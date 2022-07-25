class Cast {
  final int id;
  final String name;

  Cast({
    required this.id,
    required this.name,
  });

  factory Cast.fromMap(Map<String, dynamic> json) {
    return Cast(
      id: json['id'],
      name: json['name'],
    );
  }
}
