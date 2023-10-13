class Publicity {
  String title, description, link, type;

  Publicity(
      {required this.title,
      required this.description,
      required this.link,
      required this.type});

  factory Publicity.fromJson(Map<String, dynamic> json) {
    return Publicity(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      link: json['link'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
