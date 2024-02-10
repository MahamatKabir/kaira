class ContainerType {
  int id;
  String name;
  String slug;
  String createdAt;

  ContainerType(
      {required this.id,
      required this.name,
      required this.slug,
      required this.createdAt});

  factory ContainerType.fromJson(Map<String, dynamic> json) {
    return ContainerType(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      createdAt: json[null],
    );
  }
}
