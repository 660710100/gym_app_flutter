class Exercise {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> bodyParts;
  final List<String> equipments;
  final String type;
  final List<String> keywords;

  Exercise({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.bodyParts,
    required this.equipments,
    required this.type,
    required this.keywords,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['exerciseId'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      bodyParts: List<String>.from(json['bodyParts'] ?? []),
      equipments: List<String>.from(json['equipments'] ?? []),
      type: json['exerciseType'] ?? '',
      keywords: List<String>.from(json['keywords'] ?? []),
    );
  }
}
