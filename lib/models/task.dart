class Goal {
  String id;
  String title;
  bool isChecked;

  Goal({required this.id, required this.title, this.isChecked = false});

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        id: json["id"],
        title: json["content"],
        isChecked: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": title,
        "isCompleted": isChecked,
      };

  void toggleCheckingState() {
    isChecked = !isChecked;
  }
}
