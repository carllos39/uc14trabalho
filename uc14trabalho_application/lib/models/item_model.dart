class ItemModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id']?.toString() ?? json['name'] ?? '',
      title: json['title'] ?? json['name'] ?? '',
      description: json['description'] ?? json['subtitle'] ?? '',
      imageUrl: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'imageUrl': imageUrl,
  };
}
