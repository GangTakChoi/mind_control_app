class Task {
  int id;
  String title;
  bool isChecked;

  Task({required this.id, required this.title, this.isChecked = false});

  void toggleCheckingState() {
    isChecked = !isChecked;
  }
}
