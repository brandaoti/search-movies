class Company {
  final int id;
  final String name;

  Company({
    required this.id,
    required this.name,
  });

  factory Company.fromMap(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() => 'Companies(id: $id, name: $name)';
}
