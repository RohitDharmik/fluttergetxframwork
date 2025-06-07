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
class CompletedTask {
  String title;
  bool isCompleted;
  String? description; // Optional description

  CompletedTask({
    required this.title,
    this.isCompleted = false,
    this.description,
  });

  factory CompletedTask.fromJson(Map<String, dynamic> json) => CompletedTask(
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