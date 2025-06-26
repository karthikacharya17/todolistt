class Task {
  String id;
  String title;
  bool isDone;
  String owner;
  List<String> sharedWith;

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
    required this.owner,
    this.sharedWith = const [],
  });
}
