class Task {
  String title;
  bool isCompleted;
  String? description; // Optional description

  Task({
    required this.title,
    this.isCompleted = false,
    this.description,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'],
        isCompleted: json['isCompleted'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'isCompleted': isCompleted,
        'description': description,
      };
}